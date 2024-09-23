@implementation IMClassicTapback

+ (BOOL)isValidAssociatedMessageType:(int64_t)a3
{
  return (unint64_t)(a3 - 2000) < 6 || (unint64_t)(a3 - 3000) < 6;
}

- (IMClassicTapback)initWithAssociatedMessageType:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMClassicTapback;
  return -[IMTapback initWithAssociatedMessageType:](&v4, sel_initWithAssociatedMessageType_, a3);
}

- (id)actionStringFormatWithAdaptiveImageGlyphAvailable:(BOOL)a3
{
  uint64_t v4;
  const __CFString *v5;
  NSObject *v6;

  v4 = -[IMTapback associatedMessageType](self, "associatedMessageType", a3);
  v5 = 0;
  if (v4 > 2999)
  {
    switch(v4)
    {
      case 3000:
        v5 = CFSTR("Removed a heart from");
        break;
      case 3001:
        v5 = CFSTR("Removed a like from");
        break;
      case 3002:
        v5 = CFSTR("Removed a dislike from");
        break;
      case 3003:
        v5 = CFSTR("Removed a laugh from");
        break;
      case 3004:
        v5 = CFSTR("Removed an exclamation from");
        break;
      case 3005:
        v5 = CFSTR("Removed a question mark from");
        break;
      case 3006:
      case 3007:
LABEL_9:
        IMLogHandleForCategory("IMClassicTapback");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_19E36C0EC(self, v6);

        v5 = 0;
        break;
      default:
        return -[IMTapbackSummaryActionStringFormat initWithActionStringFormat:requiresReactionReplacment:]([IMTapbackSummaryActionStringFormat alloc], "initWithActionStringFormat:requiresReactionReplacment:", v5, 0);
    }
  }
  else
  {
    switch(v4)
    {
      case 2000:
        v5 = CFSTR("Loved");
        break;
      case 2001:
        v5 = CFSTR("Liked");
        break;
      case 2002:
        v5 = CFSTR("Disliked");
        break;
      case 2003:
        v5 = CFSTR("Laughed at");
        break;
      case 2004:
        v5 = CFSTR("Emphasized");
        break;
      case 2005:
        v5 = CFSTR("Questioned");
        break;
      case 2006:
      case 2007:
        goto LABEL_9;
      default:
        if ((unint64_t)v4 <= 3 && v4 != 1 || (unint64_t)(v4 - 1000) < 2)
          goto LABEL_9;
        break;
    }
  }
  return -[IMTapbackSummaryActionStringFormat initWithActionStringFormat:requiresReactionReplacment:]([IMTapbackSummaryActionStringFormat alloc], "initWithActionStringFormat:requiresReactionReplacment:", v5, 0);
}

- (id)reactionStringWithAdaptiveImageGlyph:(id)a3
{
  return 0;
}

- (IMClassicTapback)removedTapbackCounterpart
{
  IMClassicTapback *v3;

  if (-[IMTapback isRemoved](self, "isRemoved"))
    v3 = self;
  else
    v3 = -[IMClassicTapback initWithAssociatedMessageType:]([IMClassicTapback alloc], "initWithAssociatedMessageType:", IMCounterpartAcknowledgmentTypeForAcknowledgmentType(-[IMTapback associatedMessageType](self, "associatedMessageType")));
  return v3;
}

- (IMClassicTapback)visibleTapbackCounterpart
{
  IMClassicTapback *v3;

  if (-[IMTapback isRemoved](self, "isRemoved"))
    v3 = -[IMClassicTapback initWithAssociatedMessageType:]([IMClassicTapback alloc], "initWithAssociatedMessageType:", IMCounterpartAcknowledgmentTypeForAcknowledgmentType(-[IMTapback associatedMessageType](self, "associatedMessageType")));
  else
    v3 = self;
  return v3;
}

- (IMClassicTapback)counterpart
{
  if (-[IMTapback isRemoved](self, "isRemoved"))
    -[IMClassicTapback visibleTapbackCounterpart](self, "visibleTapbackCounterpart");
  else
    -[IMClassicTapback removedTapbackCounterpart](self, "removedTapbackCounterpart");
  return (IMClassicTapback *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)classicTapbackOptions
{
  IMClassicTapback *v2;
  IMClassicTapback *v3;
  IMClassicTapback *v4;
  IMClassicTapback *v5;
  IMClassicTapback *v6;
  IMClassicTapback *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = -[IMClassicTapback initWithAssociatedMessageType:]([IMClassicTapback alloc], "initWithAssociatedMessageType:", 2000);
  v3 = -[IMClassicTapback initWithAssociatedMessageType:]([IMClassicTapback alloc], "initWithAssociatedMessageType:", 2001);
  v4 = -[IMClassicTapback initWithAssociatedMessageType:]([IMClassicTapback alloc], "initWithAssociatedMessageType:", 2002);
  v5 = -[IMClassicTapback initWithAssociatedMessageType:]([IMClassicTapback alloc], "initWithAssociatedMessageType:", 2003);
  v6 = -[IMClassicTapback initWithAssociatedMessageType:]([IMClassicTapback alloc], "initWithAssociatedMessageType:", 2004);
  v7 = -[IMClassicTapback initWithAssociatedMessageType:]([IMClassicTapback alloc], "initWithAssociatedMessageType:", 2005);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
