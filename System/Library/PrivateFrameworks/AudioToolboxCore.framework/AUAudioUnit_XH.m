@implementation AUAudioUnit_XH

- (void)_internalInitWithExtension:(id)a3 componentDescription:(AudioComponentDescription *)a4 instance:(OpaqueAudioComponentInstance *)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSExtension **p_extension;
  NSObject **v13;
  NSExtension *v14;
  NSObject *v15;
  uint64_t v16;
  NSExtension *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  id completionBlock;
  void *v23;
  id v24;
  NSExtension *v25;
  id *v26;
  NSExtension *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  id location;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t block;
  uint64_t v41;
  void *v42;
  void *v43;
  NSExtension *v44;
  NSObject **v45;

  v10 = a3;
  v11 = a6;
  p_extension = &self->_extension;
  objc_storeStrong((id *)&self->_extension, a3);
  -[AUAudioUnit_XPC _setComponentInstance:](self, "_setComponentInstance:", a5);
  v13 = (NSObject **)CADeprecated::TSingleton<AUExtensionInstanceMap>::instance();
  v14 = self->_extension;
  v15 = *v13;
  v16 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v41 = 3221225472;
  v42 = ___ZN22AUExtensionInstanceMap29setExtensionInterruptionBlockEP11NSExtension_block_invoke;
  v43 = &unk_1E2922060;
  v44 = v14;
  v45 = v13;
  v17 = v14;
  dispatch_sync(v15, &block);

  -[NSExtension extensionPointIdentifier](self->_extension, "extensionPointIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.AudioUnit-UI"));

  objc_initWeak(&location, self);
  -[AUAudioUnit_XH setStrongInstance:](self, "setStrongInstance:", self);
  aBlock[0] = v16;
  aBlock[1] = 3221225472;
  aBlock[2] = __86__AUAudioUnit_XH__internalInitWithExtension_componentDescription_instance_completion___block_invoke;
  aBlock[3] = &unk_1E2921188;
  objc_copyWeak(&v34, &location);
  v20 = v11;
  v33 = v20;
  v21 = _Block_copy(aBlock);
  completionBlock = self->_completionBlock;
  self->_completionBlock = v21;

  if (v19)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2050000000;
    v23 = (void *)getAUAudioUnitRemoteViewControllerClass(void)::softClass;
    v39 = getAUAudioUnitRemoteViewControllerClass(void)::softClass;
    if (!getAUAudioUnitRemoteViewControllerClass(void)::softClass)
    {
      block = v16;
      v41 = 3221225472;
      v42 = ___ZL39getAUAudioUnitRemoteViewControllerClassv_block_invoke;
      v43 = &unk_1E29222D8;
      v44 = (NSExtension *)&v36;
      ___ZL39getAUAudioUnitRemoteViewControllerClassv_block_invoke((uint64_t)&block);
      v23 = (void *)v37[3];
    }
    v24 = objc_retainAutorelease(v23);
    _Block_object_dispose(&v36, 8);
    v25 = *p_extension;
    v30[0] = v16;
    v30[1] = 3221225472;
    v30[2] = __86__AUAudioUnit_XH__internalInitWithExtension_componentDescription_instance_completion___block_invoke_2;
    v30[3] = &unk_1E29211B0;
    v26 = &v31;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v24, "_fetchViewControllerForExtension:inputItems:completion:", v25, 0, v30);
  }
  else
  {
    v27 = *p_extension;
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = __86__AUAudioUnit_XH__internalInitWithExtension_componentDescription_instance_completion___block_invoke_3;
    v28[3] = &unk_1E29211D8;
    v26 = &v29;
    objc_copyWeak(&v29, &location);
    -[NSExtension beginExtensionRequestWithInputItems:completion:](v27, "beginExtensionRequestWithInputItems:completion:", 0, v28);
  }
  objc_destroyWeak(v26);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

}

- (void)_open:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSUUID *v8;
  NSUUID *requestIdentifier;
  NSObject **v10;
  NSUUID *v11;
  AUAudioUnit_XH *v12;
  NSObject *v13;
  NSUUID *v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD block[4];
  AUAudioUnit_XH *v21;
  NSUUID *v22;
  NSObject **v23;

  v6 = a3;
  v7 = a4;
  v8 = (NSUUID *)objc_msgSend(v6, "copyWithZone:", 0);
  requestIdentifier = self->_requestIdentifier;
  self->_requestIdentifier = v8;

  v10 = (NSObject **)CADeprecated::TSingleton<AUExtensionInstanceMap>::instance();
  v11 = self->_requestIdentifier;
  v12 = self;
  v13 = *v10;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN22AUExtensionInstanceMap3addEPU19objcproto9NSCopying11objc_objectP14AUAudioUnit_XH_block_invoke;
  block[3] = &unk_1E2921558;
  v22 = v11;
  v23 = v10;
  v21 = v12;
  v14 = v11;
  v15 = v12;
  dispatch_sync(v13, block);

  objc_msgSend(v15[125], "_extensionContextForUUID:", self->_requestIdentifier);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setExtension:", v15[125]);
  objc_msgSend(v16, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAudioUnit:", v15);

  objc_msgSend(v16, "xpcConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = v15;
  v19.super_class = (Class)AUAudioUnit_XH;
  -[AUAudioUnit_XPC _doOpen:completion:](&v19, sel__doOpen_completion_, v18, v7);

}

- (void)dealloc
{
  NSObject **v3;
  NSUUID *v4;
  NSObject *v5;
  NSUUID *v6;
  NSUUID *requestIdentifier;
  id speechSynthesisOutputMetadataBlock;
  objc_super v9;
  _QWORD block[4];
  NSUUID *v11;
  NSObject **v12;

  if (self->_requestIdentifier)
  {
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
    v3 = (NSObject **)CADeprecated::TSingleton<AUExtensionInstanceMap>::instance();
    v4 = self->_requestIdentifier;
    v5 = *v3;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN22AUExtensionInstanceMap6removeEPU19objcproto9NSCopying11objc_object_block_invoke;
    block[3] = &unk_1E2922060;
    v11 = v4;
    v12 = v3;
    v6 = v4;
    dispatch_sync(v5, block);

    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = 0;

  }
  speechSynthesisOutputMetadataBlock = self->_speechSynthesisOutputMetadataBlock;
  self->_speechSynthesisOutputMetadataBlock = 0;

  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnit_XH;
  -[AUAudioUnit_XPC dealloc](&v9, sel_dealloc);
}

- (void)requestViewControllerWithCompletionHandler:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[AUAudioUnit cachedViewController](self, "cachedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (void)setSpeechSynthesisOutputMetadataBlock:(id)a3
{
  id v4;
  void *v5;
  id speechSynthesisOutputMetadataBlock;
  int v7;

  v4 = a3;
  -[AUAudioUnit componentDescription](self, "componentDescription");
  if (v7 == 1635087216)
  {
    v5 = _Block_copy(v4);
    speechSynthesisOutputMetadataBlock = self->_speechSynthesisOutputMetadataBlock;
    self->_speechSynthesisOutputMetadataBlock = v5;

  }
}

- (id)speechSynthesisOutputMetadataBlock
{
  return _Block_copy(self->_speechSynthesisOutputMetadataBlock);
}

- (AUAudioUnit_XPC)strongInstance
{
  return self->_strongInstance;
}

- (void)setStrongInstance:(id)a3
{
  objc_storeStrong((id *)&self->_strongInstance, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_speechSynthesisOutputMetadataBlock, 0);
  objc_storeStrong((id *)&self->_strongInstance, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

+ (void)instantiateWithExtension:(id)a3 componentDescription:(AudioComponentDescription *)a4 instance:(OpaqueAudioComponentInstance *)a5 options:(unsigned int)a6 completionHandler:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  UInt32 componentFlagsMask;
  id location;
  id v25;
  AudioComponentDescription v26;

  v8 = *(_QWORD *)&a6;
  v11 = a3;
  v12 = a7;
  v13 = objc_alloc((Class)objc_opt_class());
  v26 = *a4;
  v25 = 0;
  v14 = (void *)objc_msgSend(v13, "initWithComponentDescription:options:error:", &v26, v8, &v25);
  v15 = v25;
  v16 = v15;
  if (v14)
    v17 = v15 == 0;
  else
    v17 = 0;
  if (v17)
  {
    if (objc_msgSend(v14, "isMemberOfClass:", objc_opt_class()))
    {
      v18 = objc_initWeak(&location, v14);
      v22 = *(_OWORD *)&a4->componentType;
      componentFlagsMask = a4->componentFlagsMask;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __99__AUAudioUnit_XH_instantiateWithExtension_componentDescription_instance_options_completionHandler___block_invoke;
      v19[3] = &unk_1E2921188;
      v20 = v12;
      objc_copyWeak(&v21, &location);
      objc_msgSend(v14, "_internalInitWithExtension:componentDescription:instance:completion:", v11, &v22, a5, v19);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v14, 0);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v15);
  }

}

@end
