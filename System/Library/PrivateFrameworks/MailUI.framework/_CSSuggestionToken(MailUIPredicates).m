@implementation _CSSuggestionToken(MailUIPredicates)

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___CSSuggestionToken_MailUIPredicates__log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (id)log_log;
}

- (id)mui_messageListSearchPredicate
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = objc_msgSend(a1, "tokenKind");
  v3 = 0;
  switch(v2)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesWithAttachments");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 15:
    case 17:
    case 18:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
      return v3;
    case 5:
      objc_msgSend(a1, "itemSummary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_datePredicate");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 14:
      objc_msgSend(a1, "itemSummary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mui_messageListSearchPredicate");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 16:
      objc_msgSend(a1, "itemSummary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_personPredicate");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 19:
      objc_msgSend(a1, "itemSummary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_readStatusPredicate");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
      objc_msgSend(a1, "_flagColorPredicate");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_3:
      v3 = (void *)v4;
      return v3;
    case 33:
      objc_msgSend(a1, "itemSummary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_flagStatusPredicate");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    default:
      if (v2 != 46)
        return v3;
      objc_msgSend(a1, "itemSummary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_senderContainsPredicate");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v3 = (void *)v6;

      return v3;
  }
}

- (id)_flagColorPredicate
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;

  switch(objc_msgSend(a1, "tokenKind"))
  {
    case 26:
      v2 = (void *)MEMORY[0x1E0D1E248];
      v3 = 0;
      goto LABEL_12;
    case 27:
      v2 = (void *)MEMORY[0x1E0D1E248];
      v3 = 1;
      goto LABEL_12;
    case 28:
      v2 = (void *)MEMORY[0x1E0D1E248];
      v3 = 2;
      goto LABEL_12;
    case 29:
      v2 = (void *)MEMORY[0x1E0D1E248];
      v3 = 3;
      goto LABEL_12;
    case 30:
      v2 = (void *)MEMORY[0x1E0D1E248];
      v3 = 4;
      goto LABEL_12;
    case 31:
      v2 = (void *)MEMORY[0x1E0D1E248];
      v3 = 5;
      goto LABEL_12;
    case 32:
      v2 = (void *)MEMORY[0x1E0D1E248];
      v3 = 6;
LABEL_12:
      objc_msgSend(v2, "predicateForFlagColor:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CA6BB0], "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[_CSSuggestionToken(MailUIPredicates) _flagColorPredicate].cold.1(a1, v4);

      v5 = 0;
      break;
  }
  return v5;
}

- (void)_flagColorPredicate
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "tokenKind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1D5522000, a2, v4, "_CSSuggestionTokenKindPerson token:%@ has unsupported tokenKind:%@.", v5);

  OUTLINED_FUNCTION_3();
}

@end
