@implementation AVCompositionTrackFormatDescriptionReplacement

- (AVCompositionTrackFormatDescriptionReplacement)initWithOriginalFormatDescription:(opaqueCMFormatDescription *)a3 andReplacementFormatDescription:(opaqueCMFormatDescription *)a4
{
  AVCompositionTrackFormatDescriptionReplacement *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCompositionTrackFormatDescriptionReplacement;
  v6 = -[AVCompositionTrackFormatDescriptionReplacement init](&v8, sel_init);
  if (v6)
  {
    v6->_originalFormatDescription = (opaqueCMFormatDescription *)CFRetain(a3);
    v6->_replacementFormatDescription = (opaqueCMFormatDescription *)CFRetain(a4);
  }
  return v6;
}

- (void)dealloc
{
  opaqueCMFormatDescription *originalFormatDescription;
  opaqueCMFormatDescription *replacementFormatDescription;
  objc_super v5;

  originalFormatDescription = self->_originalFormatDescription;
  if (originalFormatDescription)
    CFRelease(originalFormatDescription);
  replacementFormatDescription = self->_replacementFormatDescription;
  if (replacementFormatDescription)
    CFRelease(replacementFormatDescription);
  v5.receiver = self;
  v5.super_class = (Class)AVCompositionTrackFormatDescriptionReplacement;
  -[AVCompositionTrackFormatDescriptionReplacement dealloc](&v5, sel_dealloc);
}

- (CMFormatDescriptionRef)originalFormatDescription
{
  return self->_originalFormatDescription;
}

- (CMFormatDescriptionRef)replacementFormatDescription
{
  return self->_replacementFormatDescription;
}

- (AVCompositionTrackFormatDescriptionReplacement)initWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AVCompositionTrackFormatDescriptionReplacement *v9;

  v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalFormatDescription"));
  if (v5)
    v6 = AVFormatDescriptionFromSerializedAtomData(v5);
  else
    v6 = 0;
  v7 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replacementFormatDescription"));
  if (v7)
  {
    v8 = AVFormatDescriptionFromSerializedAtomData(v7);

    if (v6 && v8)
    {
      v9 = -[AVCompositionTrackFormatDescriptionReplacement initWithOriginalFormatDescription:andReplacementFormatDescription:]([AVCompositionTrackFormatDescriptionReplacement alloc], "initWithOriginalFormatDescription:andReplacementFormatDescription:", v6, v8);
      CFRelease(v6);
      v6 = v8;
LABEL_9:
      CFRelease(v6);
      return v9;
    }
    if (v6)
      CFRelease(v6);
    v9 = 0;
    v6 = v8;
    if (v8)
      goto LABEL_9;
  }
  else
  {

    v9 = 0;
    if (v6)
      goto LABEL_9;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = AVSerializedAtomDataFromFormatDescription(self->_originalFormatDescription);
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("originalFormatDescription"));

  }
  v7 = AVSerializedAtomDataFromFormatDescription(self->_replacementFormatDescription);
  if (v7)
  {
    v8 = (id)v7;
    objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("replacementFormatDescription"));

  }
}

@end
