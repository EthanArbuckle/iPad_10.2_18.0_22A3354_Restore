@implementation MDMBlockOperationContext

- (void)endBlockOperation
{
  id v2;

  -[MDMBlockOperationContext operation](self, "operation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endOperationWithResultObject:", 0);

}

- (MDMBlockOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
  objc_storeStrong((id *)&self->_operation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
}

@end
