@implementation IMSharedMessageRichLinkSummary

+ (id)pluginPath
{
  return CFSTR("/System/Library/Messages/iMessageBalloons/RichLinkProvider.bundle");
}

+ (id)previewSummaryWithPluginPayload:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___IMSharedMessageRichLinkSummary;
  v4 = objc_msgSendSuper2(&v7, sel_previewSummaryWithPluginPayload_);
  if (objc_msgSend(a3, "data"))
  {
    v4 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "dataSourceClass"), "individualPreviewSummaryForPluginPayload:", a3), "copy");
    if (!v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "dataSourceClass")), "initWithPluginPayload:", a3);
      v4 = (id)objc_msgSend((id)objc_msgSend(v5, "individualPreviewSummary"), "copy");
      if (v5)

    }
  }
  return v4;
}

+ (id)linkMetadataForPluginPayload:(id)a3
{
  void *v4;
  id v5;

  if (!objc_msgSend(a3, "data"))
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "dataSourceClass")), "initWithPluginPayload:", a3);
  v5 = (id)objc_msgSend((id)objc_msgSend(v4, "richLinkMetadata"), "copy");
  if (v4)

  return v5;
}

@end
