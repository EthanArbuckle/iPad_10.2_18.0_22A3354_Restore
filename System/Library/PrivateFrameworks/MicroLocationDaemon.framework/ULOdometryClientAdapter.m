@implementation ULOdometryClientAdapter

- (void)didReceiveOdometryError:(id)a3 withDate:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  v6 = a4;
  -[ULOdometryClientAdapter didReceiveOdometryErrorBlock](self, "didReceiveOdometryErrorBlock");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))v7)[2](v7, v8, v6);

}

- (void)didReceiveOdometryUpdate:(id)a3 uuid:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  v6 = a4;
  -[ULOdometryClientAdapter didReceiveOdometryUpdateBlock](self, "didReceiveOdometryUpdateBlock");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))v7)[2](v7, v8, v6);

}

- (id)didReceiveOdometryErrorBlock
{
  return self->_didReceiveOdometryErrorBlock;
}

- (void)setDidReceiveOdometryErrorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)didReceiveOdometryUpdateBlock
{
  return self->_didReceiveOdometryUpdateBlock;
}

- (void)setDidReceiveOdometryUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didReceiveOdometryUpdateBlock, 0);
  objc_storeStrong(&self->_didReceiveOdometryErrorBlock, 0);
}

@end
