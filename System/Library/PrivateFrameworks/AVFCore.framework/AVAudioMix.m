@implementation AVAudioMix

- (AVAudioMix)init
{
  AVAudioMix *v2;
  AVAudioMixInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAudioMix;
  v2 = -[AVAudioMix init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVAudioMixInternal);
    v2->_audioMix = v3;
    if (v3)
    {
      CFRetain(v3);
      v2->_audioMix->inputParameters = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  AVAudioMixInternal *audioMix;
  objc_super v4;

  audioMix = self->_audioMix;
  if (audioMix)
  {

    CFRelease(self->_audioMix);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioMix;
  -[AVAudioMix dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, input parameters = %@>"), NSStringFromClass(v4), self, -[AVAudioMix inputParameters](self, "inputParameters"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVAudioMix *v5;
  AVAudioMix *v6;

  if (-[AVAudioMix isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    return self;
  v5 = -[AVAudioMix init](+[AVAudioMix allocWithZone:](AVAudioMix, "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
    -[AVAudioMix setInputParameters:](v5, "setInputParameters:", self->_audioMix->inputParameters);
  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AVMutableAudioMix *v4;
  AVMutableAudioMix *v5;

  v4 = -[AVAudioMix init](+[AVMutableAudioMix allocWithZone:](AVMutableAudioMix, "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
    -[AVMutableAudioMix setInputParameters:](v4, "setInputParameters:", self->_audioMix->inputParameters);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v5;
  _BOOL4 v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[NSArray count](-[AVAudioMix inputParameters](self, "inputParameters"), "count"),
        v5 == objc_msgSend((id)objc_msgSend(a3, "inputParameters"), "count")))
  {
    if (!-[AVAudioMix inputParameters](self, "inputParameters")
      || (v6 = -[NSArray isEqualToArray:](-[AVAudioMix inputParameters](self, "inputParameters"), "isEqualToArray:", objc_msgSend(a3, "inputParameters"))))
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (unint64_t)hash
{
  return -[NSArray hash](-[AVAudioMix inputParameters](self, "inputParameters"), "hash");
}

- (NSArray)inputParameters
{
  return self->_audioMix->inputParameters;
}

- (void)setInputParameters:(id)a3
{
  NSArray *v3;
  NSArray *inputParameters;

  if (a3)
    v3 = (NSArray *)a3;
  else
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  inputParameters = self->_audioMix->inputParameters;
  if (inputParameters != v3)
  {

    self->_audioMix->inputParameters = (NSArray *)-[NSArray copy](v3, "copy");
  }
}

- (id)audioMixInputParametersForTrackID:(int)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[AVAudioMix inputParameters](self, "inputParameters", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "trackID") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

@end
