@implementation DTKPSessionRecordBundle

- (NSArray)dataBlocks
{
  return self->_dataBlocks;
}

- (void)setDataBlocks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (DTTapMemo)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
  objc_storeStrong((id *)&self->_memo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memo, 0);
  objc_storeStrong((id *)&self->_dataBlocks, 0);
}

@end
