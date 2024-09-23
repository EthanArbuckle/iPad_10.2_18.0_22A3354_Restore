@implementation MKMessageGroup

- (MKMessageGroup)init
{
  MKMessageGroup *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKMessageGroup;
  v2 = -[MKMessageGroup init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "generatedRoomNameForGroupChat");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMessageGroup setRoomName:](v2, "setRoomName:", v3);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMessageGroup setID:](v2, "setID:", v5);

  }
  return v2;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ID, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
}

@end
