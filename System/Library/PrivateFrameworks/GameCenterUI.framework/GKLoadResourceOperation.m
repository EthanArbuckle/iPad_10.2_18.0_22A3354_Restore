@implementation GKLoadResourceOperation

- (void)didCompleteWithResource:(id)a3 error:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  v6 = a4;
  -[GKLoadResourceOperation outputBlock](self, "outputBlock");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[GKLoadResourceOperation setOutputBlock:](self, "setOutputBlock:", 0);
    ((void (**)(_QWORD, id, id))v7)[2](v7, v8, v6);
  }

}

- (void)main
{
  -[GKLoadResourceOperation didCompleteWithResource:error:](self, "didCompleteWithResource:error:", 0, 0);
}

- (id)outputBlock
{
  return objc_getProperty(self, a2, 248, 1);
}

- (void)setOutputBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (int64_t)_loadReason
{
  return self->__loadReason;
}

- (void)_setLoadReason:(int64_t)a3
{
  self->__loadReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
}

@end
