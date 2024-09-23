@implementation ActionTreeProgrammaticDetails

- (ActionTreeProgrammaticDetails)init
{
  ActionTreeProgrammaticDetails *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *streamNodeFormats;
  ActionTreeProgrammaticDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ActionTreeProgrammaticDetails;
  v2 = -[ActionTreeProgrammaticDetails init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    streamNodeFormats = v2->_streamNodeFormats;
    v2->_streamNodeFormats = v3;

    v5 = v2;
  }

  return v2;
}

- (NSMutableDictionary)streamNodeFormats
{
  return self->_streamNodeFormats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamNodeFormats, 0);
}

@end
