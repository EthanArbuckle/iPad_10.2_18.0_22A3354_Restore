@implementation FCCKPrivateDatabaseCKProperties

- (id)initWithContainers:(void *)a3 database:(void *)a4 databaseWithZoneWidePCS:(void *)a5 secureDatabase:
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  objc_super v16;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)FCCKPrivateDatabaseCKProperties;
    a1 = (id *)objc_msgSendSuper2(&v16, sel_init);
    if (a1)
    {
      v13 = objc_msgSend(v9, "copy");
      v14 = a1[4];
      a1[4] = (id)v13;

      objc_storeStrong(a1 + 1, a3);
      objc_storeStrong(a1 + 2, a4);
      objc_storeStrong(a1 + 3, a5);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_secureDatabase, 0);
  objc_storeStrong((id *)&self->_databaseWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
