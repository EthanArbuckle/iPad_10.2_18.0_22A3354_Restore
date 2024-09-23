@implementation SKPresence(ForwardDeclare)

- (void)assertPresenceWithPresencePayloadDictionary:()ForwardDeclare completion:
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DACA70]), "initWithDictionary:", v8);
    objc_msgSend(a1, "assertPresenceWithPresencePayload:completion:", v7, v6);

  }
  else
  {
    objc_msgSend(a1, "assertPresenceWithCompletion:", v6);
  }

}

@end
