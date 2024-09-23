@implementation APUICardService

- (BOOL)canSatisfyCardRequest:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[APUICardRequestSatisfactionCriteria generalSatisfactionCriteria](APUICardRequestSatisfactionCriteria, "generalSatisfactionCriteria");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canSatisfyCardRequest:", v3);

  return v5;
}

- (NSString)serviceIdentifier
{
  return (NSString *)(id)objc_msgSend((id)kAPUICardServiceIdentifier, "copy");
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = a3;
  +[APUICardRequestSatisfactionCriteria customIntentSatisfactionCriteria](APUICardRequestSatisfactionCriteria, "customIntentSatisfactionCriteria");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "servicePriorityForRequest:", v3);

  +[APUICardRequestSatisfactionCriteria compactSatisfactionCriteria](APUICardRequestSatisfactionCriteria, "compactSatisfactionCriteria");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "servicePriorityForRequest:", v3);

  if (v5 <= v7)
    return v7;
  else
    return v5;
}

- (void)requestCard:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  APUIActionCardViewConfig *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  int v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (v7)
  {
    if (-[APUICardService canSatisfyCardRequest:](self, "canSatisfyCardRequest:", v6))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "cardViewConfig");
        v8 = (APUIActionCardViewConfig *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = objc_alloc_init(APUIActionCardViewConfig);
        -[APUIActionCardViewConfig setStyle:](v8, "setStyle:", 2);
        -[APUIActionCardViewConfig setShowThumbnailImage:](v8, "setShowThumbnailImage:", 1);
        -[APUIActionCardViewConfig setShowAppFootnote:](v8, "setShowAppFootnote:", 1);
        -[APUIActionCardViewConfig setShowActionButton:](v8, "setShowActionButton:", 1);
      }
      objc_msgSend(v6, "content");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        -[APUIActionCardViewConfig bundleId](v8, "bundleId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "length");

        if (!v14)
        {
          objc_msgSend(v12, "_bundleIdForDisplay");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[APUIActionCardViewConfig setBundleId:](v8, "setBundleId:", v15);

        }
        +[APUIActionCardUtils cardSectionForATXAction:withConfig:](APUIActionCardUtils, "cardSectionForATXAction:withConfig:", v12, v8);
        v9 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "intent");
        v16 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = v11;
          objc_msgSend(v18, "intent");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "intentResponse");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[APUIActionCardUtils cardSectionForINInteraction:withConfig:](APUIActionCardUtils, "cardSectionForINInteraction:withConfig:", v18, v8);
          v9 = objc_claimAutoreleasedReturnValue();

          goto LABEL_25;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[APUIActionCardUtils cardSectionForNSUserActivity:withConfig:](APUIActionCardUtils, "cardSectionForNSUserActivity:withConfig:", v11, v8);
            v19 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              __atxlog_handle_ui();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
                -[APUICardService requestCard:reply:].cold.3(v6, v32);

              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 0, 0);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v7[2](v7, 0, v17);
              v16 = 0;
              v9 = 0;
              goto LABEL_36;
            }
            +[APUIActionCardUtils cardSectionForHeroApp:withConfig:](APUIActionCardUtils, "cardSectionForHeroApp:withConfig:", v11, v8);
            v19 = objc_claimAutoreleasedReturnValue();
          }
          v9 = v19;
          v17 = 0;
          v16 = 0;
LABEL_25:
          +[APUIActionCardUtils cardForCardSection:](APUIActionCardUtils, "cardForCardSection:", v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v16, "backingStore");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "data");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setIntentMessageData:", v22);

            objc_msgSend(v16, "_intentInstanceDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "type");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setIntentMessageName:", v24);

          }
          if (v17)
          {
            __atxlog_handle_ui();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v33) = 0;
              _os_log_impl(&dword_226339000, v25, OS_LOG_TYPE_DEFAULT, "settings ActionCardService intentResponse...", (uint8_t *)&v33, 2u);
            }

            objc_msgSend(v17, "backingStore");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "data");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setIntentResponseMessageData:", v27);

            objc_msgSend(v17, "_payloadResponseTypeName");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setIntentResponseMessageName:", v28);

            __atxlog_handle_ui();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              -[APUICardService requestCard:reply:].cold.2(v20, v29);

            __atxlog_handle_ui();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v20, "intentResponseMessageName");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = 138412290;
              v34 = v31;
              _os_log_impl(&dword_226339000, v30, OS_LOG_TYPE_DEFAULT, "name: %@", (uint8_t *)&v33, 0xCu);

            }
          }
          ((void (**)(id, void *, void *))v7)[2](v7, v20, 0);

LABEL_36:
          goto LABEL_37;
        }
        v16 = v11;
        +[APUIActionCardUtils cardSectionForINIntent:withConfig:](APUIActionCardUtils, "cardSectionForINIntent:withConfig:", v16, v8);
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v17 = 0;
      goto LABEL_25;
    }
    __atxlog_handle_ui();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[APUICardService requestCard:reply:].cold.4((uint64_t)v6, v10);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);
  }
  else
  {
    __atxlog_handle_ui();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[APUICardService requestCard:reply:].cold.1(v9);
  }
LABEL_37:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)requestCard:(os_log_t)log reply:.cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = 5501;
  _os_log_error_impl(&dword_226339000, log, OS_LOG_TYPE_ERROR, "e:%ld * No reply block specified for cardRequest!", (uint8_t *)&v1, 0xCu);
}

- (void)requestCard:(void *)a1 reply:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "intentResponseMessageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_226339000, a2, OS_LOG_TYPE_DEBUG, "data: %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_0();
}

- (void)requestCard:(void *)a1 reply:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_226339000, a2, OS_LOG_TYPE_FAULT, "e:fault The cardContent is not something we can render: %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_0();
}

- (void)requestCard:(uint64_t)a1 reply:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 134218242;
  v3 = 5501;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_226339000, a2, OS_LOG_TYPE_ERROR, "e:%ld * We cannot satisfy the card request: %@", (uint8_t *)&v2, 0x16u);
}

@end
