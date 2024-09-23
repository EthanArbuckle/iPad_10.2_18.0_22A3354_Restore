@implementation AVSessionManager

- (_TtC18CoreIDVRGBLiveness16AVSessionManager)init
{
  return (_TtC18CoreIDVRGBLiveness16AVSessionManager *)sub_2139A9638();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_2139AFB18((uint64_t)self + OBJC_IVAR____TtC18CoreIDVRGBLiveness16AVSessionManager_delegate);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)captureOutput:(id)a3 willCapturePhotoForResolvedSettings:(id)a4
{
  id v6;
  id v7;
  _TtC18CoreIDVRGBLiveness16AVSessionManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2139ADF68();

}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC18CoreIDVRGBLiveness16AVSessionManager *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_2139AE2A4(v9, a5);

}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  id v6;
  id v7;
  _TtC18CoreIDVRGBLiveness16AVSessionManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2139AEC10(v7);

}

@end
