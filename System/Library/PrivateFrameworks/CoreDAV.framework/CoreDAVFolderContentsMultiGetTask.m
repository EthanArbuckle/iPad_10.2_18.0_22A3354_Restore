@implementation CoreDAVFolderContentsMultiGetTask

- (CoreDAVFolderContentsMultiGetTask)initWithURLs:(id)a3 atContainerURL:(id)a4 appSpecificDataItemClass:(Class)a5
{
  CoreDAVFolderContentsMultiGetTask *v5;
  CoreDAVFolderContentsMultiGetTask *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CoreDAVFolderContentsMultiGetTask;
  v5 = -[CoreDAVContainerMultiGetTask initWithURLs:atContainerURL:appSpecificDataItemClass:](&v8, sel_initWithURLs_atContainerURL_appSpecificDataItemClass_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->super._appSpecificNamespace, CFSTR("DAV:"));
    objc_storeStrong((id *)&v6->super._appSpecificMultiGetCommand, CFSTR("multiget"));
    objc_storeStrong((id *)&v6->super._appSpecificDataProp, CFSTR("getcontent"));
  }
  return v6;
}

- (id)copyAdditionalPropElements
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[objc_class copyPropertyMappingsForParser](self->super._appSpecificDataItemClass, "copyPropertyMappingsForParser");
  else
    return 0;
}

- (void)setAdditionalProperties:(id)a3 onDataItem:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "applyParsedProperties:", v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CoreDAVTask responseHeaders](self, "responseHeaders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postProcessWithResponseHeaders:", v7);

  }
}

@end
