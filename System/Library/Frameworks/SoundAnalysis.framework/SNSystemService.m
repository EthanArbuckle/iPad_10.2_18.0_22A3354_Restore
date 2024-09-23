@implementation SNSystemService

+ (id)audiomxdLaunch
{
  void *v2;
  _QWORD v4[6];

  static SNSystemService.audiomxdLaunch()();
  v4[4] = nullsub_1;
  v4[5] = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 1107296256;
  v4[2] = sub_1D43B1CEC;
  v4[3] = &unk_1E97B34E0;
  v2 = _Block_copy(v4);
  swift_release();
  return v2;
}

- (SNSystemService)init
{
  return (SNSystemService *)SNSystemService.init()();
}

@end
