@implementation ASVError

+ (id)errorWithCode:(unsigned int)a3 localizedDescription:(id)a4
{
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDD0FC8];
  v6[0] = a4;
  return +[ASVError errorWithDomain:code:userInfo:](ASVError, "errorWithDomain:code:userInfo:", CFSTR("ASV"), a3, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
}

- (id)localizedDescription
{
  void *v3;
  id result;
  objc_super v5;

  v3 = (void *)-[ASVError userInfo](self, "userInfo");
  if (!v3 || (result = (id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDD0FC8])) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)ASVError;
    return -[ASVError localizedDescription](&v5, sel_localizedDescription);
  }
  return result;
}

@end
