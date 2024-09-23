@implementation WKPDFFormMutationObserver

- (WKPDFFormMutationObserver)initWithPlugin:(void *)a3
{
  WKPDFFormMutationObserver *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKPDFFormMutationObserver;
  result = -[WKPDFFormMutationObserver init](&v5, sel_init);
  if (result)
    result->_plugin = a3;
  return result;
}

- (void)formChanged:(id)a3
{
  uint64_t v4;
  id *plugin;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  WebKit *v11;
  unsigned __int8 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *((_BYTE *)self->_plugin + 544) = 1;
  v4 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("PDFFormFieldName"));
  plugin = (id *)self->_plugin;
  v6 = (void *)objc_msgSend(plugin[37], "annotationsForFieldName:", v4);
  v7 = v6;
  if (v6)
    CFRetain(v6);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(WebKit **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v12 = WebKit::UnifiedPDFPlugin::repaintRequirementsForAnnotation(v11);
        WebKit::UnifiedPDFPlugin::setNeedsRepaintForAnnotation((uint64_t)plugin, v11, v12);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  if (v7)
    CFRelease(v7);
}

@end
