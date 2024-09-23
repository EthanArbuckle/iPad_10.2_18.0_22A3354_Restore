@implementation KeyboardObserver

- (void)keyboardWillShow:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_20D634A88();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D634A70();
  swift_retain();
  sub_20D629C84();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)keyboardWillHide:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD v7[2];

  v3 = sub_20D634A88();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D634A70();
  swift_getKeyPath();
  swift_getKeyPath();
  v7[1] = 0;
  swift_retain();
  sub_20D634C38();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
