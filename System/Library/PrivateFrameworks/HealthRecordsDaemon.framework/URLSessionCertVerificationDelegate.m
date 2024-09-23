@implementation URLSessionCertVerificationDelegate

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC19HealthRecordsDaemon34URLSessionCertVerificationDelegate *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_21FB0CCB4(v10, v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (_TtC19HealthRecordsDaemon34URLSessionCertVerificationDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for URLSessionCertVerificationDelegate();
  return -[URLSessionCertVerificationDelegate init](&v3, sel_init);
}

@end
