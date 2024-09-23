@implementation BLTBulletinStorageBulletin

- (void)setBulletin:(id)a3
{
  id v5;
  unint64_t v6;
  id v7;

  objc_storeStrong((id *)&self->_bulletin, a3);
  v5 = a3;
  objc_msgSend(v5, "context");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = +[BLTObjectSerializer sizeOfObject:](BLTObjectSerializer, "sizeOfObject:", v7);

  self->_contextSize = v6;
}

- (unint64_t)contextSize
{
  return self->_contextSize;
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletin, 0);
}

@end
