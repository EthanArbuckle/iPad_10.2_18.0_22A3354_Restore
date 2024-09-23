@implementation _NSPlaceholderObservation

- (_NSPlaceholderObservation)initWithObservable:(id)a3 blockSink:(id)a4 tag:(int)a5
{
  uint64_t v5;
  int v8;
  __objc2_class **v9;

  v5 = *(_QWORD *)&a5;
  v8 = objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCD1520);
  v9 = off_1E0F114E8;
  if (!v8)
    v9 = off_1E0F11468;
  return (_NSPlaceholderObservation *)objc_msgSend(objc_alloc(*v9), "initWithObservable:blockSink:tag:", a3, a4, v5);
}

- (_NSPlaceholderObservation)initWithObservable:(id)a3 observer:(id)a4
{
  int v6;
  int v7;
  BOOL v8;
  int v9;
  __objc2_class **v10;
  __objc2_class **v11;
  __objc2_class **v12;

  v6 = objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCD1520);
  v7 = objc_msgSend(a4, "conformsToProtocol:", &unk_1EDCD3238);
  if (v7)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8 && objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCD3238))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Observable object %@ cannot also be an owning observer."), a3), 0));
  v9 = objc_msgSend(a4, "conformsToProtocol:", &unk_1EDCD14C0);
  v10 = off_1E0F11470;
  if (v9)
    v10 = off_1E0F114E0;
  v11 = off_1E0F114F0;
  if (v9)
    v11 = off_1E0F114C0;
  if (v6)
    v10 = v11;
  if (v9)
    v12 = off_1E0F114F8;
  else
    v12 = off_1E0F11500;
  if (v7)
    v10 = v12;
  return (_NSPlaceholderObservation *)objc_msgSend(objc_alloc(*v10), "initWithObservable:observer:", a3, a4);
}

- (unint64_t)retainCount
{
  return -1;
}

@end
