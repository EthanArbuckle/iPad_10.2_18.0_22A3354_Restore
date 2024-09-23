@implementation LKUsers

- (LKUsers)initWithUsers:(id)a3
{
  id v5;
  LKUsers *v6;
  LKUsers *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LKUsers;
  v6 = -[LKUsers init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_students, a3);

  return v7;
}

- (NSArray)students
{
  return self->_students;
}

- (void)setStudents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_students, 0);
}

@end
