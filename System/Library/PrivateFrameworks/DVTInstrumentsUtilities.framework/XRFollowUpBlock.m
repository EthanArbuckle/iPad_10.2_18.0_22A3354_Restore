@implementation XRFollowUpBlock

- (XRFollowUpBlock)initWithBlock:(id)a3 operation:(id)a4
{
  id v6;
  id v7;
  XRFollowUpBlock *v8;
  uint64_t v9;
  id block;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XRFollowUpBlock;
  v8 = -[XRFollowUpBlock init](&v12, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x227696724](v6);
    block = v8->_block;
    v8->_block = (id)v9;

    objc_storeStrong((id *)&v8->_op, a4);
  }

  return v8;
}

- (void)go
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSOperation *v8;

  objc_storeStrong((id *)&self->_myselfOrNil, self);
  v8 = self->_op;
  objc_msgSend_addObserver_forKeyPath_options_context_(v8, v3, (uint64_t)self, (uint64_t)CFSTR("isFinished"), 1, qword_25583BF80);
  if (objc_msgSend_isFinished(v8, v4, v5, v6, v7))
    sub_226351FC4(self);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v8 = a4;
  if ((void *)qword_25583BF80 == a6)
  {
    v14 = v8;
    v9 = v8;
    if (objc_msgSend_isFinished(v9, v10, v11, v12, v13))
      sub_226351FC4(self);

    v8 = v14;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myselfOrNil, 0);
  objc_storeStrong((id *)&self->_op, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
