@implementation CertUIPrompt

- (void)setHost:(id)a3
{
  void (*v4)(uint64_t, char *);
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (a3)
  {
    sub_1A594B40C();
    v4 = *(void (**)(uint64_t, char *))self->_setHostname;
    v5 = *(_QWORD *)self->underlying;
    swift_retain();
    v6 = sub_1A594B3F4();
  }
  else
  {
    v4 = *(void (**)(uint64_t, char *))self->_setHostname;
    v5 = *(_QWORD *)self->underlying;
    swift_retain();
    v6 = 0;
  }
  v7 = (id)v6;
  v4(v5, sel_setHost_);
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)setService:(id)a3
{
  void (*v4)(uint64_t, char *);
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (a3)
  {
    sub_1A594B40C();
    v4 = *(void (**)(uint64_t, char *))self->_setService;
    v5 = *(_QWORD *)self->underlying;
    swift_retain();
    v6 = sub_1A594B3F4();
  }
  else
  {
    v4 = *(void (**)(uint64_t, char *))self->_setService;
    v5 = *(_QWORD *)self->underlying;
    swift_retain();
    v6 = 0;
  }
  v7 = (id)v6;
  v4(v5, sel_setService_);
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)setTrust:(__SecTrust *)a3
{
  (*(void (**)(_QWORD, char *, __SecTrust *))self->_setTrust)(*(_QWORD *)self->underlying, sel_setTrust_, a3);
}

- (void)showPromptWithOptions:(id)a3 responseBlock:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a4);
  if (a3)
    a3 = (id)sub_1A594AFC8();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  swift_retain();
  sub_1A5789DD0((uint64_t)a3, (uint64_t)sub_1A578A33C, v6);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
