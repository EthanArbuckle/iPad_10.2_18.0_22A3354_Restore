@implementation PHASETargetRoomAcousticParameters

- (PHASETargetRoomAcousticParameters)init
{
  PHASETargetRoomAcousticParameters *v2;
  NSMutableArray *v3;
  NSMutableArray *internalArray;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHASETargetRoomAcousticParameters;
  v2 = -[PHASETargetRoomAcousticParameters init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    internalArray = v2->_internalArray;
    v2->_internalArray = v3;

  }
  return v2;
}

- (PHASETargetRoomAcousticParameters)initWithSubbandParameters:(id)a3
{
  id v4;
  PHASETargetRoomAcousticParameters *v5;
  uint64_t v6;
  NSMutableArray *internalArray;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHASETargetRoomAcousticParameters;
  v5 = -[PHASETargetRoomAcousticParameters init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    internalArray = v5->_internalArray;
    v5->_internalArray = (NSMutableArray *)v6;

  }
  return v5;
}

- (NSArray)subbandParameters
{
  return (NSArray *)self->_internalArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalArray, 0);
}

@end
