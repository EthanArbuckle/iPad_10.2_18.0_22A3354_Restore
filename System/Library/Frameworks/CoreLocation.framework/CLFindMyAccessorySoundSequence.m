@implementation CLFindMyAccessorySoundSequence

- (CLFindMyAccessorySoundSequence)initWithType:(unint64_t)a3 encodedSequence:(id)a4
{
  CLFindMyAccessorySoundSequence *v6;
  CLFindMyAccessorySoundSequence *v7;
  NSMutableData *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLFindMyAccessorySoundSequence;
  v6 = -[CLFindMyAccessorySoundSequence init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    if (a4)
      v8 = (NSMutableData *)a4;
    else
      v8 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v7->_encodedSequence = v8;
  }
  return v7;
}

- (CLFindMyAccessorySoundSequence)initWithType:(unint64_t)a3
{
  return (CLFindMyAccessorySoundSequence *)MEMORY[0x1E0DE7D20](self, sel_initWithType_encodedSequence_, a3, 0);
}

- (CLFindMyAccessorySoundSequence)init
{
  return (CLFindMyAccessorySoundSequence *)MEMORY[0x1E0DE7D20](self, sel_initWithType_encodedSequence_, 2, 0);
}

+ (id)defaultSequence
{
  CLFindMyAccessorySoundSequence *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;

  v2 = [CLFindMyAccessorySoundSequence alloc];
  v5 = (void *)objc_msgSend_initWithType_(v2, v3, 1, v4);
  objc_msgSend_addSoundBlockWithAsset_loopCount_duration_(v5, v6, 4, 1, 0);
  objc_msgSend_addSoundBlockWithAsset_loopCount_duration_(v5, v7, 5, 2, 0);
  return v5;
}

+ (id)shortSequence
{
  CLFindMyAccessorySoundSequence *v2;
  const char *v3;
  uint64_t v4;

  v2 = [CLFindMyAccessorySoundSequence alloc];
  return (id)objc_msgSend_initWithType_(v2, v3, 0, v4);
}

+ (id)rangingSequence
{
  CLFindMyAccessorySoundSequence *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;

  v2 = [CLFindMyAccessorySoundSequence alloc];
  v5 = (void *)objc_msgSend_initWithType_(v2, v3, 0, v4);
  objc_msgSend_addSoundBlockWithAsset_loopCount_duration_(v5, v6, 4, 1, 0);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessorySoundSequence;
  -[CLFindMyAccessorySoundSequence dealloc](&v3, sel_dealloc);
}

- (void)addSoundBlockWithAsset:(unint64_t)a3 loopCount:(unsigned __int8)a4 duration:(unsigned __int16)a5
{
  const char *v6;
  const char *v7;
  char v8;
  unsigned __int16 v9;
  unsigned __int8 v10;

  v10 = a4;
  v9 = a5;
  v8 = a3;
  objc_msgSend_appendBytes_length_(self->_encodedSequence, a2, (uint64_t)&v8, 1);
  objc_msgSend_appendBytes_length_(self->_encodedSequence, v6, (uint64_t)&v10, 1);
  objc_msgSend_appendBytes_length_(self->_encodedSequence, v7, (uint64_t)&v9, 2);
}

- (NSData)encodedSequence
{
  return &self->_encodedSequence->super;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLFindMyAccessorySoundSequence *v4;
  unint64_t type;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = [CLFindMyAccessorySoundSequence alloc];
  type = self->_type;
  v9 = objc_msgSend_mutableCopy(self->_encodedSequence, v6, v7, v8);
  return (id)MEMORY[0x1E0DE7D20](v4, sel_initWithType_encodedSequence_, type, v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessorySoundSequence)initWithCoder:(id)a3
{
  CLFindMyAccessorySoundSequence *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v4 = [CLFindMyAccessorySoundSequence alloc];
  v7 = objc_msgSend_decodeIntegerForKey_(a3, v5, (uint64_t)CFSTR("Type"), v6);
  v8 = objc_opt_class();
  v10 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("EncodedSequence"));
  return (CLFindMyAccessorySoundSequence *)MEMORY[0x1E0DE7D20](v4, sel_initWithType_encodedSequence_, v7, v10);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_type, (uint64_t)CFSTR("Type"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_encodedSequence, (uint64_t)CFSTR("EncodedSequence"));
}

- (unint64_t)type
{
  return self->_type;
}

@end
