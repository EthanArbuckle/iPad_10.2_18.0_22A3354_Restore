@implementation AVAudioSemantics

- (AVAudioSemantics)init
{

  return 0;
}

- (AVAudioSemantics)initWithChannelGroups:(id)a3
{
  id v5;
  AVAudioSemantics *v6;
  AVAudioSemantics *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVAudioSemantics;
  v6 = -[AVAudioSemantics init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_channelGroups, a3);

  return v7;
}

- (AVAudioSemantics)initWithAudioSemantics:(__CFArray *)a3
{
  AVAudioSemantics *v4;
  __CFArray *v5;
  NSArray *v6;
  __CFArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AVAudioChannelGroupSemantics *v12;
  AVAudioChannelGroupSemantics *v13;
  NSArray *channelGroups;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)AVAudioSemantics;
  v4 = -[AVAudioSemantics init](&v20, sel_init);
  if (v4)
  {
    v5 = a3;
    v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[__CFArray count](v5, "count"));
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          v12 = [AVAudioChannelGroupSemantics alloc];
          v13 = -[AVAudioChannelGroupSemantics initWithAudioChannelGroupSemantics:](v12, "initWithAudioChannelGroupSemantics:", v11, (_QWORD)v16);
          -[NSArray addObject:](v6, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v8);
    }

    channelGroups = v4->_channelGroups;
    v4->_channelGroups = v6;

  }
  return v4;
}

- (AVAudioSemantics)initWithCoder:(id)a3
{
  id v4;
  AVAudioSemantics *v5;
  uint64_t v6;
  NSArray *channelGroups;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVAudioSemantics;
  v5 = -[AVAudioSemantics init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("channelGroups"));
    v6 = objc_claimAutoreleasedReturnValue();
    channelGroups = v5->_channelGroups;
    v5->_channelGroups = (NSArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_channelGroups, CFSTR("channelGroups"));
}

- (NSArray)channelGroups
{
  return self->_channelGroups;
}

- (void)setChannelGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelGroups, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
