@implementation AVAudioChannelLayout

- (AVAudioChannelLayout)initWithLayoutTag:(AudioChannelLayoutTag)layoutTag
{
  _DWORD v4[8];

  if ((layoutTag & 0xFFFEFFFF) != 0)
  {
    v4[1] = 0;
    v4[2] = 0;
    v4[0] = layoutTag;
    return -[AVAudioChannelLayout initWithLayout:](self, "initWithLayout:", v4);
  }
  else
  {

    return 0;
  }
}

- (AVAudioChannelLayout)initWithLayout:(const AudioChannelLayout *)layout
{
  AVAudioChannelLayout *v4;
  AVAudioChannelLayout *v5;
  AudioChannelLayoutTag mChannelLayoutTag;
  size_t v7;
  AudioChannelLayout *v8;
  objc_super v10;

  if (layout)
  {
    v10.receiver = self;
    v10.super_class = (Class)AVAudioChannelLayout;
    v4 = -[AVAudioChannelLayout init](&v10, sel_init);
    v5 = v4;
    if (v4)
    {
      mChannelLayoutTag = layout->mChannelLayoutTag;
      v4->_layoutTag = layout->mChannelLayoutTag;
      if (mChannelLayoutTag)
        v7 = 12;
      else
        v7 = 20 * layout->mNumberChannelDescriptions + 12;
      v8 = (AudioChannelLayout *)malloc_type_malloc(v7, 0x8C1817CEuLL);
      v5->_layout = v8;
      memcpy(v8, layout, v7);
      if (v5->_layoutTag)
        v5->_layout->mNumberChannelDescriptions = 0;
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (unint64_t)layoutSize
{
  unint64_t result;

  result = -[AVAudioChannelLayout layout](self, "layout");
  if (result)
  {
    if (*(_DWORD *)-[AVAudioChannelLayout layout](self, "layout"))
      return 12;
    else
      return 20 * -[AVAudioChannelLayout layout](self, "layout")[8] + 12;
  }
  return result;
}

- (const)layout
{
  return self->_layout;
}

- (AVAudioChannelCount)channelCount
{
  AudioChannelLayout *layout;
  uint8x8_t v4;

  layout = self->_layout;
  if (layout->mChannelLayoutTag == 0x10000)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)layout->mChannelBitmap);
    v4.i16[0] = vaddlv_u8(v4);
    return v4.i32[0];
  }
  else if (layout->mChannelLayoutTag)
  {
    return (unsigned __int16)layout->mChannelLayoutTag;
  }
  else
  {
    return layout->mNumberChannelDescriptions;
  }
}

- (AVAudioChannelLayout)init
{

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_layout);
  v3.receiver = self;
  v3.super_class = (Class)AVAudioChannelLayout;
  -[AVAudioChannelLayout dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)object
{
  unsigned int (*PropertyProc)(uint64_t, uint64_t, _QWORD *, uint64_t *, char *);
  BOOL v6;
  int v8;
  uint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (object == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (-[AVAudioChannelLayout layout](self, "layout") && objc_msgSend(object, "layout"))
  {
    v10[0] = -[AVAudioChannelLayout layout](self, "layout", 4);
    v10[1] = objc_msgSend(object, "layout");
    PropertyProc = (unsigned int (*)(uint64_t, uint64_t, _QWORD *, uint64_t *, char *))GetAudioFormatGetPropertyProc();
    if (PropertyProc(1667786097, 16, v10, &v9, (char *)&v9 + 4))
      v6 = 1;
    else
      v6 = HIDWORD(v9) == 0;
    return !v6;
  }
  else
  {
    v8 = objc_msgSend(object, "layoutTag");
    return v8 == -[AVAudioChannelLayout layoutTag](self, "layoutTag");
  }
}

- (unint64_t)hash
{
  void (*PropertyProc)(uint64_t, uint64_t, AudioChannelLayout *, int *, unsigned int *);
  int v5;
  unsigned int v6;

  v5 = 4;
  v6 = 0;
  PropertyProc = (void (*)(uint64_t, uint64_t, AudioChannelLayout *, int *, unsigned int *))GetAudioFormatGetPropertyProc();
  PropertyProc(1667786849, 8, self->_layout, &v5, &v6);
  return v6;
}

- (AudioChannelLayoutTag)layoutTag
{
  return self->_layoutTag;
}

- (void)encodeWithCoder:(id)a3
{
  unsigned int v5;

  v5 = -[AVAudioChannelLayout layoutSize](self, "layoutSize");
  objc_msgSend(a3, "encodeBytes:length:", &v5, 4);
  objc_msgSend(a3, "encodeBytes:length:", self->_layout, v5);
}

- (AVAudioChannelLayout)initWithCoder:(id)a3
{
  _DWORD *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v5 = (_DWORD *)objc_msgSend(a3, "decodeBytesWithReturnedLength:", &v9);
  v6 = objc_msgSend(a3, "decodeBytesWithReturnedLength:", &v8);
  if (v5 && v6 && v9 == 4 && v8 == *v5)
    return -[AVAudioChannelLayout initWithLayout:](self, "initWithLayout:", v6);

  objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, 0));
  return 0;
}

+ (AVAudioChannelLayout)layoutWithLayoutTag:(AudioChannelLayoutTag)layoutTag
{
  return -[AVAudioChannelLayout initWithLayoutTag:]([AVAudioChannelLayout alloc], "initWithLayoutTag:", *(_QWORD *)&layoutTag);
}

+ (AVAudioChannelLayout)layoutWithLayout:(const AudioChannelLayout *)layout
{
  return -[AVAudioChannelLayout initWithLayout:]([AVAudioChannelLayout alloc], "initWithLayout:", layout);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
