@implementation IKJSViewModelService

- (id)openLinkForType:(id)a3 document:(id)a4 extraInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  IKJSViewModelLink *v11;
  void *v12;
  IKJSViewModelLink *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  IKJSViewModelLink *v21;
  void *v22;
  _QWORD v24[5];

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = [IKJSViewModelLink alloc];
  -[IKJSObject appContext](self, "appContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IKJSObject initWithAppContext:](v11, "initWithAppContext:", v12);

  -[IKJSViewModelLink setDocument:](v13, "setDocument:", v10);
  if (v9)
  {
    v14 = (void *)objc_msgSend(v9, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("requestType"));
  -[IKJSObject appContext](self, "appContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "jsApp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v15, "copy");
  v19 = objc_msgSend(v17, "requestDocumentWithContext:response:", v18, v13);

  if ((v19 & 1) == 0)
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("viewModelLink"));
    v20 = (void *)objc_msgSend(v15, "copy");
    -[IKJSEventListenerObject invokeSingleListener:extraInfo:return:](self, "invokeSingleListener:extraInfo:return:", v8, v20, 0);

  }
  v21 = v13;
  -[IKJSObject appContext](self, "appContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __59__IKJSViewModelService_openLinkForType_document_extraInfo___block_invoke;
  v24[3] = &__block_descriptor_40_e19_v16__0__JSContext_8l;
  v24[4] = v21;
  objc_msgSend(v22, "addPostEvaluateBlock:", v24);

  return v21;
}

void __59__IKJSViewModelService_openLinkForType_document_extraInfo___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
