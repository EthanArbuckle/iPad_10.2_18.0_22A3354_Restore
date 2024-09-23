@implementation ICAudioRecordingViewController

+ (id)getHostingViewForAttachmentModel:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = _sSo30ICAudioRecordingViewControllerC7NotesUIE010getHostingC018forAttachmentModel8delegateSo06UIViewD0CSo017ICAttachmentAudioK0C_So0abcD8Delegate_pSgtFZ_0(v5, (uint64_t)a4);

  swift_unknownObjectRelease();
  return v6;
}

+ (id)audioAttachmentInsideViewController:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = _sSo30ICAudioRecordingViewControllerC7NotesUIE15audioAttachment6insideSo12ICAttachmentCSgSo06UIViewD0C_tFZ_0(v3);

  return v4;
}

+ (BOOL)presentedViewControllerIsAudio:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EECA4400);
  return swift_dynamicCastClass() != 0;
}

+ (void)containerViewDidResize:(id)a3
{
  id v3;

  v3 = a3;
  _sSo30ICAudioRecordingViewControllerC7NotesUIE09containerC9DidResizeyySo06UIViewD0CFZ_0(v3);

}

- (ICAudioRecordingViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICAudioRecordingViewController;
  return -[ICAudioRecordingViewController init](&v3, sel_init);
}

@end
