@implementation D2DSetupBackupSyncViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService32D2DSetupBackupSyncViewController *v2;

  v2 = self;
  sub_10006AB78();

}

- (_TtC18SharingViewService32D2DSetupBackupSyncViewController)initWithContentView:(id)a3
{
  objc_super v5;

  *(_QWORD *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService32D2DSetupBackupSyncViewController_backupSymbolView] = 0;
  *(_QWORD *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService32D2DSetupBackupSyncViewController_progressView] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for D2DSetupBackupSyncViewController();
  return -[D2DSetupBaseViewController initWithContentView:](&v5, "initWithContentView:", a3);
}

- (void).cxx_destruct
{

}

@end
