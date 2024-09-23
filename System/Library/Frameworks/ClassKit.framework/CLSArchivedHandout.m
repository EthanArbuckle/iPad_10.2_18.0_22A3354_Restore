@implementation CLSArchivedHandout

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D409DA58;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB770 != -1)
    dispatch_once(&qword_1ED0FB770, block);
  return (id)qword_1ED0FB768;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSArchivedHandout;
  return -[CLSAbstractHandout _init](&v3, sel__init);
}

- (NSArray)attachments
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (CLSArchivedHandout)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLSArchivedHandout;
  return -[CLSAbstractHandout initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSArchivedHandout;
  -[CLSAbstractHandout encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
