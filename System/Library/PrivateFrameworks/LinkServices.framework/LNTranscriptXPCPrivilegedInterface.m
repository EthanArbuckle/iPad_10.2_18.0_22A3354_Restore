@implementation LNTranscriptXPCPrivilegedInterface

uint64_t __LNTranscriptXPCPrivilegedInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE65F6A0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LNTranscriptXPCPrivilegedInterface_interface;
  LNTranscriptXPCPrivilegedInterface_interface = v0;

  objc_msgSend((id)LNTranscriptXPCPrivilegedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_donateWithActionRecord_reply_, 0, 0);
  objc_msgSend((id)LNTranscriptXPCPrivilegedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_donateWithActionRecord_reply_, 0, 1);
  objc_msgSend((id)LNTranscriptXPCPrivilegedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_donateActionRecordData_writeImmediately_reply_, 0, 1);
  objc_msgSend((id)LNTranscriptXPCPrivilegedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_donateActionRecordData_bundleIdentifier_timestamp_writeImmediately_reply_, 0, 1);
  objc_msgSend((id)LNTranscriptXPCPrivilegedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_requestReadAccessWithReply_, 0, 1);
  objc_msgSend((id)LNTranscriptXPCPrivilegedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_requestReadAccessWithReply_, 1, 1);
  objc_msgSend((id)LNTranscriptXPCPrivilegedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_deleteRecordsWithMatchingPredicate_reply_, 0, 0);
  v2 = (void *)LNTranscriptXPCPrivilegedInterface_interface;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_deleteRecordsWithMatchingPredicate_reply_, 0, 1);

  objc_msgSend((id)LNTranscriptXPCPrivilegedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_deleteRecordsWithMatchingPredicate_reply_, 1, 1);
  objc_msgSend((id)LNTranscriptXPCPrivilegedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_deleteAllRecordsWithReply_, 0, 1);
  objc_msgSend((id)LNTranscriptXPCPrivilegedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_requestReadAccessForStream_reply_, 0, 0);
  objc_msgSend((id)LNTranscriptXPCPrivilegedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_requestReadAccessForStream_reply_, 0, 1);
  return objc_msgSend((id)LNTranscriptXPCPrivilegedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_requestReadAccessForStream_reply_, 1, 1);
}

@end
