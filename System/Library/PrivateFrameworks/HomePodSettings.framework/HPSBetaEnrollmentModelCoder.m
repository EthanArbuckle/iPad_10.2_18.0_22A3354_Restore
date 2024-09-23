@implementation HPSBetaEnrollmentModelCoder

- (BOOL)deserialize:(id)a3 withElement:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  HPSBetaEnrollmentModelCoder *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_22DFDCE90();
  v12 = v11;

  sub_22DF65084(v10, v12, v8);
  sub_22DF32DB0(v10, v12);
  return 1;
}

- (id)serialize:(id)a3 error:(id *)a4
{
  id v5;
  HPSBetaEnrollmentModelCoder *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  v5 = a3;
  v6 = self;
  v7 = sub_22DF652DC(v5);
  v9 = v8;

  v10 = (void *)sub_22DFDCE6C();
  sub_22DF32DB0((uint64_t)v7, v9);
  return v10;
}

- (HPSBetaEnrollmentModelCoder)init
{
  return (HPSBetaEnrollmentModelCoder *)BetaEnrollment.ModelCoder.init()();
}

@end
