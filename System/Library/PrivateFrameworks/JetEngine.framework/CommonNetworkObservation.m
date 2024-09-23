@implementation CommonNetworkObservation

- (void)networkStateDidChange:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = sub_19CFDEA74();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19CFDEA50();
  swift_retain();
  sub_19CDB9DDC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

@end
