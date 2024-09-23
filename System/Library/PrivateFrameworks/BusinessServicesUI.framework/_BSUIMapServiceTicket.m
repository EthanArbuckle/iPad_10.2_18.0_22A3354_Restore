@implementation _BSUIMapServiceTicket

- (void)submitWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (self)
    self = (_BSUIMapServiceTicket *)self->_serviceTicket;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43___BSUIMapServiceTicket_submitWithHandler___block_invoke;
  v6[3] = &unk_24FE17970;
  v7 = v4;
  v5 = v4;
  -[_BSUIMapServiceTicket submitWithHandler:networkActivity:](self, "submitWithHandler:networkActivity:", v6, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceTicket, 0);
}

@end
