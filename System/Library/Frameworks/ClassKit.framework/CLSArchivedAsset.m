@implementation CLSArchivedAsset

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40561AC;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB378 != -1)
    dispatch_once(&qword_1ED0FB378, block);
  return (id)qword_1ED0FB370;
}

@end
