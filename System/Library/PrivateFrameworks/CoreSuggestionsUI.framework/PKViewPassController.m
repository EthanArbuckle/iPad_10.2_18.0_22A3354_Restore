@implementation PKViewPassController

- (_TtC17CoreSuggestionsUI20PKViewPassController)initWithCoder:(id)a3
{
  sub_1B11A88A4();
}

- (void)viewDidLoad
{
  _TtC17CoreSuggestionsUI20PKViewPassController *v2;

  v2 = self;
  sub_1B11A8908();
  OUTLINED_FUNCTION_3(v2);
}

- (void)dismissalPressed:(id)a3
{
  id v4;
  _TtC17CoreSuggestionsUI20PKViewPassController *v5;

  v4 = a3;
  v5 = self;
  sub_1B11A8E3C();

}

- (_TtC17CoreSuggestionsUI20PKViewPassController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B11BB3C8();
  v5 = a4;
  sub_1B11A8EBC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI20PKViewPassController_passViewManager));
}

@end
