@implementation BWPhotoDescriptor

- (BWPhotoDescriptor)initWithPhotoIdentifier:(id)a3 processingFlags:(unsigned int)a4
{
  char *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWPhotoDescriptor;
  v6 = -[BWPhotoDescriptor init](&v9, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 1) = objc_msgSend(a3, "copy");
    *((_DWORD *)v6 + 4) = a4;
    v7 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v6 + 52) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v6 + 68) = *(_QWORD *)(v7 + 16);
  }
  return (BWPhotoDescriptor *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWPhotoDescriptor)initWithPhotoIdentifier:(id)a3 processingFlags:(unsigned int)a4 time:(id)a5 timeZone:(id)a6 presentationTimeStamp:(id *)a7
{
  BWPhotoDescriptor *v12;
  __int128 v14;
  int64_t var3;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BWPhotoDescriptor;
  v12 = -[BWPhotoDescriptor init](&v16, sel_init);
  if (v12)
  {
    v12->_photoIdentifier = (NSString *)objc_msgSend(a3, "copy");
    v12->_processingFlags = a4;
    -[BWPhotoDescriptor setTime:](v12, "setTime:", a5);
    -[BWPhotoDescriptor setTimeZone:](v12, "setTimeZone:", a6);
    v14 = *(_OWORD *)&a7->var0;
    var3 = a7->var3;
    -[BWPhotoDescriptor setPresentationTimeStamp:](v12, "setPresentationTimeStamp:", &v14);
  }
  return v12;
}

- (BWPhotoDescriptor)initWithCoder:(id)a3
{
  BWPhotoDescriptor *v4;
  uint64_t v5;
  const __CFDictionary *v6;
  CMTime v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWPhotoDescriptor;
  v4 = -[BWPhotoDescriptor init](&v9, sel_init);
  if (v4)
  {
    v4->_photoIdentifier = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoIdentifer"));
    v4->_processingFlags = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processingFlags")), "unsignedIntValue");
    -[BWPhotoDescriptor setTime:](v4, "setTime:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time")));
    -[BWPhotoDescriptor setTimeZone:](v4, "setTimeZone:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone")));
    v5 = objc_opt_class();
    v6 = (const __CFDictionary *)objc_msgSend(a3, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v5, objc_opt_class(), CFSTR("timeStamp"));
    CMTimeMakeFromDictionary(&v8, v6);
    -[BWPhotoDescriptor setPresentationTimeStamp:](v4, "setPresentationTimeStamp:", &v8);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const __CFAllocator *v5;
  CFDictionaryRef v6;
  CMTime v7;

  objc_msgSend(a3, "encodeObject:forKey:", self->_photoIdentifier, CFSTR("photoIdentifer"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_processingFlags), CFSTR("processingFlags"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_time, CFSTR("time"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  *(_OWORD *)&v7.value = *(_OWORD *)(&self->_timeZoneHasBeenSet + 4);
  v7.epoch = *(_QWORD *)&self->_presentationTimeStamp.flags;
  v6 = CMTimeCopyAsDictionary(&v7, v5);
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("timeStamp"));

}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPhotoDescriptor;
  -[BWPhotoDescriptor dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSString *v7;
  int v8;
  unsigned int v9;
  NSDate *v10;
  NSTimeZone *v11;
  CMTime v13;
  CMTime time1;
  uint64_t v15;
  uint64_t v16;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
    return v8;
  }
  v15 = v3;
  v16 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  v7 = -[BWPhotoDescriptor photoIdentifier](self, "photoIdentifier");
  if (v7 != (NSString *)objc_msgSend(a3, "photoIdentifier"))
  {
    v8 = -[NSString isEqual:](-[BWPhotoDescriptor photoIdentifier](self, "photoIdentifier"), "isEqual:", objc_msgSend(a3, "photoIdentifier"));
    if (!v8)
      return v8;
  }
  v9 = -[BWPhotoDescriptor processingFlags](self, "processingFlags");
  if (v9 != objc_msgSend(a3, "processingFlags"))
  {
LABEL_13:
    LOBYTE(v8) = 0;
    return v8;
  }
  v10 = -[BWPhotoDescriptor time](self, "time");
  if (v10 == (NSDate *)objc_msgSend(a3, "time")
    || (v8 = -[NSDate isEqual:](-[BWPhotoDescriptor time](self, "time"), "isEqual:", objc_msgSend(a3, "time"))) != 0)
  {
    v11 = -[BWPhotoDescriptor timeZone](self, "timeZone");
    if (v11 == (NSTimeZone *)objc_msgSend(a3, "timeZone")
      || (v8 = -[NSTimeZone isEqual:](-[BWPhotoDescriptor timeZone](self, "timeZone"), "isEqual:", objc_msgSend(a3, "timeZone"))) != 0)
    {
      if (self)
      {
        -[BWPhotoDescriptor presentationTimeStamp](self, "presentationTimeStamp");
        if (a3)
        {
LABEL_12:
          objc_msgSend(a3, "presentationTimeStamp");
LABEL_18:
          LOBYTE(v8) = CMTimeCompare(&time1, &v13) == 0;
          return v8;
        }
      }
      else
      {
        memset(&time1, 0, sizeof(time1));
        if (a3)
          goto LABEL_12;
      }
      memset(&v13, 0, sizeof(v13));
      goto LABEL_18;
    }
  }
  return v8;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_photoIdentifier, "hash");
}

- (void)setTime:(id)a3
{
  self->_time = (NSDate *)a3;
  self->_timeHasBeenSet = 1;
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTimeZone:(id)a3
{
  self->_timeZone = (NSTimeZone *)a3;
  self->_timeZoneHasBeenSet = 1;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setPresentationTimeStamp:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_presentationTimeStamp.flags = a3->var3;
  *(_OWORD *)(&self->_timeZoneHasBeenSet + 4) = v3;
  BYTE4(self->_presentationTimeStamp.epoch) = 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[2].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[2].var3 + 4);
  return self;
}

- (id)description
{
  void *v3;
  const __CFAllocator *v4;
  __CFString *v5;
  CMTime time;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p>: "), objc_opt_class(), self);
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  *(_OWORD *)&time.value = *(_OWORD *)(&self->_timeZoneHasBeenSet + 4);
  time.epoch = *(_QWORD *)&self->_presentationTimeStamp.flags;
  v5 = (__CFString *)CMTimeCopyDescription(v4, &time);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: %@, flags: \"%@\", time: \"%@\", timeZone: \"%@\", presentationTimeStamp: %@"), self->_photoIdentifier, FigAppleMakerNoteStillImageProcessingFlagsToShortString(self->_processingFlags), self->_time, self->_timeZone, v5);

  return v3;
}

- (NSString)photoIdentifier
{
  return self->_photoIdentifier;
}

- (unsigned)processingFlags
{
  return self->_processingFlags;
}

@end
