@implementation ICLiveLinkIdentity(BehaviorMusicSharePlayAdditions)

- (_QWORD)msp_mpcParticipant
{
  MPCSharedSessionParticipant *v2;
  _QWORD *v3;
  _QWORD *v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v2 = [MPCSharedSessionParticipant alloc];
  if (v2)
  {
    v12.receiver = v2;
    v12.super_class = (Class)MPCSharedSessionParticipant;
    v3 = objc_msgSendSuper2(&v12, sel_init);
    v4 = v3;
    if (v3)
      v3[2] = 1;
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(a1, "externalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v5, v6, 24);

  objc_msgSend(a1, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v8, v9, 32);

  v10 = objc_msgSend(a1, "serverID");
  if (v4)
    v4[5] = v10;
  return v4;
}

@end
