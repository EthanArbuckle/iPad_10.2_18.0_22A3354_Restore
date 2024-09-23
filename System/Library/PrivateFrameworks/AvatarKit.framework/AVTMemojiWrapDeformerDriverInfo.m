@implementation AVTMemojiWrapDeformerDriverInfo

- (AVTMemojiWrapDeformerDriverInfo)init
{
  AVTMemojiWrapDeformerDriverInfo *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *driverNodes;
  NSMutableDictionary *v5;
  NSMutableDictionary *driverStates;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTMemojiWrapDeformerDriverInfo;
  v2 = -[AVTMemojiWrapDeformerDriverInfo init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    driverNodes = v2->_driverNodes;
    v2->_driverNodes = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    driverStates = v2->_driverStates;
    v2->_driverStates = v5;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverStates, 0);
  objc_storeStrong((id *)&self->_driverNodes, 0);
}

@end
