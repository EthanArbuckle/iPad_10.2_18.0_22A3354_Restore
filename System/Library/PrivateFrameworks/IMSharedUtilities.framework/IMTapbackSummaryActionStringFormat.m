@implementation IMTapbackSummaryActionStringFormat

- (IMTapbackSummaryActionStringFormat)initWithActionStringFormat:(id)a3 requiresReactionReplacment:(BOOL)a4
{
  id v6;
  IMTapbackSummaryActionStringFormat *v7;
  uint64_t v8;
  NSString *actionStringFormat;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMTapbackSummaryActionStringFormat;
  v7 = -[IMTapbackSummaryActionStringFormat init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    actionStringFormat = v7->_actionStringFormat;
    v7->_actionStringFormat = (NSString *)v8;

    v7->_requiresReactionReplacment = a4;
  }

  return v7;
}

- (NSString)actionStringFormat
{
  return self->_actionStringFormat;
}

- (BOOL)requiresReactionReplacment
{
  return self->_requiresReactionReplacment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionStringFormat, 0);
}

@end
