@implementation ClimateFanContinuousStepper

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateFanContinuousStepper_fan));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateFanContinuousStepper_powerButton));
}

- (void)fanService:(id)a3 didUpdateFanLevel:(unsigned __int8)a4
{
  id v5;
  _TtC7Climate27ClimateFanContinuousStepper *v6;

  v5 = a3;
  v6 = self;
  sub_10007B490();

}

- (void)fanService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5;
  _TtC7Climate27ClimateFanContinuousStepper *v6;

  v5 = a3;
  v6 = self;
  sub_10007B8A4();

}

- (void)fanService:(id)a3 didUpdateAutoMode:(BOOL)a4
{
  id v5;
  _TtC7Climate27ClimateFanContinuousStepper *v6;

  v5 = a3;
  v6 = self;
  sub_1000787D4();

}

@end
