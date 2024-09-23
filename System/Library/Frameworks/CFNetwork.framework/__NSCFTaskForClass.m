@implementation __NSCFTaskForClass

- (_QWORD)initWithGroup:(void *)a1
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)__NSCFTaskForClass;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
    v3[11] = a2;
  return v3;
}

- (void)dealloc
{
  SEL v3;
  SEL v4;
  SEL v5;
  SEL v6;
  SEL v7;
  SEL v8;
  SEL v9;
  SEL v10;
  SEL v11;
  __NSURLSessionTaskGroupForConfiguration *group;
  objc_super v13;

  if (self)
  {
    objc_setProperty_atomic(self, a2, 0, 8);
    objc_setProperty_atomic(self, v3, 0, 16);
    objc_setProperty_atomic(self, v4, 0, 24);
    objc_setProperty_atomic(self, v5, 0, 32);
    objc_setProperty_atomic(self, v6, 0, 40);
    objc_setProperty_atomic_copy(self, v7, 0, 48);
    objc_setProperty_atomic(self, v8, 0, 56);
    objc_setProperty_atomic(self, v9, 0, 64);
    objc_setProperty_atomic_copy(self, v10, 0, 72);
    objc_setProperty_atomic(self, v11, 0, 80);
  }
  group = self->_group;
  if (group)
  {

    self->_group = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)__NSCFTaskForClass;
  -[__NSCFTaskForClass dealloc](&v13, sel_dealloc);
}

@end
