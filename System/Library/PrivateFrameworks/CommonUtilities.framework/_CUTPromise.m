@implementation _CUTPromise

- (_CUTPromise)initWithQueue:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  dispatch_group_t v8;
  id v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CUTPromise;
  v6 = -[CUTUnsafePromise _init](&v11, sel__init);
  v7 = v6;
  if (v6)
  {
    *((_BYTE *)v6 + 24) = 0;
    objc_storeStrong(v6 + 1, a3);
    v8 = dispatch_group_create();
    v9 = v7[2];
    v7[2] = v8;

    dispatch_group_enter((dispatch_group_t)v7[2]);
  }

  return (_CUTPromise *)v7;
}

- (void)_fulfillWithResult:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;

  v5 = a3;
  -[_CUTPromise queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[_CUTPromise done](self, "done"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CUTPromise.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.done"));

  }
  -[_CUTPromise setDone:](self, "setDone:", 1);
  -[_CUTPromise setResult:](self, "setResult:", v5);

  -[_CUTPromise group](self, "group");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v8);

}

- (void)registerResultBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[_CUTPromise group](self, "group");
  v5 = objc_claimAutoreleasedReturnValue();
  -[_CUTPromise queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A0BC8F40;
  v8[3] = &unk_1E44902D0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_group_notify(v5, v6, v8);

}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (CUTResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
