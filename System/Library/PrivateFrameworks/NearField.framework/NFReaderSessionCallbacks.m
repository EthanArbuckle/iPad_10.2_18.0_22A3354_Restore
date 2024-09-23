@implementation NFReaderSessionCallbacks

+ (id)interface
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE407178);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_didDetectTags_connectedTagIndex_, 0, 0);

  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback_, 0, 0);

  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  v10 = objc_opt_class();
  v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback_, 1, 0);

  return v2;
}

@end
