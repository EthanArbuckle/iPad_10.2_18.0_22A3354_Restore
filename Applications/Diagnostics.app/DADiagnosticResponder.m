@implementation DADiagnosticResponder

- (void)enableVolumeHUD:(BOOL)a3
{
  _QWORD block[4];
  BOOL v4;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000137E0;
  block[3] = &unk_100133228;
  v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  NSObject *v6;
  _QWORD block[4];
  float v8;
  BOOL v9;

  v6 = dispatch_queue_create("com.apple.Diagnostics.brightnessQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000139A0;
  block[3] = &unk_100133268;
  v9 = a4;
  v8 = a3;
  dispatch_async(v6, block);

}

@end
