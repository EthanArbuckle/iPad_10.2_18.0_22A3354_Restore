@implementation _BSTransactionChildRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childTransaction, 0);
}

@end
