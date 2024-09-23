@implementation HAPComponent

- (HAPComponent)initWithDelegate:(id)a3
{
  id v4;
  HAPComponent *v5;
  HAPComponent *v6;

  v4 = a3;
  v5 = -[HAPComponent init](self, "init");
  v6 = v5;
  if (v5)
    -[HAPComponent setCentralManagerDelegate:](v5, "setCentralManagerDelegate:", v4);

  return v6;
}

- (HAPBTLECentralManagerDelegate)centralManagerDelegate
{
  return (HAPBTLECentralManagerDelegate *)objc_loadWeakRetained((id *)&self->centralManagerDelegate);
}

- (void)setCentralManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->centralManagerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->centralManagerDelegate);
}

@end
