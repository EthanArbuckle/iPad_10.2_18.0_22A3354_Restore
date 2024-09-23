@implementation ULOdometryMO

+ (id)createFromEntry:(const void *)a3 inManagedObjectContext:(id)a4
{
  id v5;
  ULOdometryMO *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a4;
  v6 = -[ULOdometryMO initWithContext:]([ULOdometryMO alloc], "initWithContext:", v5);
  LODWORD(v7) = llroundf(*(float *)a3 * 128.0);
  -[ULOdometryMO setDeltaPositionX:](v6, "setDeltaPositionX:", v7);
  LODWORD(v8) = llroundf(*((float *)a3 + 1) * 128.0);
  -[ULOdometryMO setDeltaPositionY:](v6, "setDeltaPositionY:", v8);
  LODWORD(v9) = llroundf(*((float *)a3 + 2) * 128.0);
  -[ULOdometryMO setDeltaPositionZ:](v6, "setDeltaPositionZ:", v9);
  -[ULOdometryMO setTimestamp:](v6, "setTimestamp:", *((double *)a3 + 2));
  -[ULOdometryMO setTrajectoryUUID:](v6, "setTrajectoryUUID:", *((_QWORD *)a3 + 3));

  return v6;
}

- (optional<CLMiLoOdometryTable::Entry>)convertToEntry
{
  uint64_t v1;
  uint64_t v3;
  float v4;
  float v5;
  float v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  optional<CLMiLoOdometryTable::Entry> result;

  v3 = v1;
  v4 = (float)(int)-[ULOdometryMO deltaPositionX](self, "deltaPositionX") * 0.0078125;
  v5 = (float)(int)-[ULOdometryMO deltaPositionY](self, "deltaPositionY") * 0.0078125;
  v6 = (float)(int)-[ULOdometryMO deltaPositionZ](self, "deltaPositionZ") * 0.0078125;
  -[ULOdometryMO timestamp](self, "timestamp");
  v8 = v7;
  -[ULOdometryMO trajectoryUUID](self, "trajectoryUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CLMiLoOdometryTable::Entry::Entry((uint64_t)&v13, v9, v4, v5, v6, v8);
  *(_OWORD *)v3 = v13;
  v10 = v15;
  v15 = 0;
  *(_QWORD *)(v3 + 16) = v14;
  *(_QWORD *)(v3 + 24) = v10;
  *(_BYTE *)(v3 + 32) = 1;

  *((_QWORD *)&result.var0.var2 + 1) = v12;
  result.var0.var2 = v11;
  return result;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ULOdometryMO"));
}

@end
