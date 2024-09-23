@implementation IMDCoreSpotlightMessageTapbackIndexer

+ (int)_searchableAttributeFromAssociatedMessageType:(int64_t)a3
{
  int result;

  result = 1;
  if (a3 > 2999)
  {
    if ((unint64_t)(a3 - 3000) < 8)
      return 0;
  }
  else
  {
    switch(a3)
    {
      case 2001:
        result = 2;
        break;
      case 2002:
        result = 3;
        break;
      case 2003:
        result = 5;
        break;
      case 2004:
        result = 4;
        break;
      case 2005:
        result = 6;
        break;
      case 2006:
        result = 7;
        break;
      case 2007:
        result = 9;
        break;
      default:
        if ((unint64_t)a3 <= 3 && a3 != 1 || (unint64_t)(a3 - 1000) < 2)
          return 0;
        break;
    }
  }
  return result;
}

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v9 = a6;
  objc_msgSend(v20, "objectForKey:", CFSTR("associatedMessageType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "integerValue");
    if (v12)
    {
      v13 = v12;
      v14 = objc_msgSend(a1, "_searchableAttributeFromAssociatedMessageType:", v12);
      objc_msgSend(v20, "objectForKey:", CFSTR("associatedMessageGUID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:", CFSTR("attributedBody"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      _IMDCoreSpotlightStrippedBody(v20, (uint64_t)CFSTR("plainBody"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTextContent:", v18);
      objc_msgSend(v9, "setMessageTapbackType:", v14);
      objc_msgSend(v9, "setTapbackAssociatedMessageID:", v15);
      objc_msgSend(v9, "setMessageType:", CFSTR("tpbck"));
      objc_msgSend(v9, "setDisableSearchInSpotlight:", MEMORY[0x1E0C9AAB0]);
      if (v13 == 2006)
      {
        objc_msgSend(v20, "objectForKey:", CFSTR("associatedMessageEmoji"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setMessageTapbackStringValue:", v19);

      }
    }
  }

}

@end
