@implementation HDDevicelessProfile

- (HDDevicelessProfile)initWithDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4 daemon:(id)a5 profileIdentifier:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDDevicelessProfile;
  return -[HDProfile initWithDirectoryPath:medicalIDDirectoryPath:daemon:profileIdentifier:](&v7, sel_initWithDirectoryPath_medicalIDDirectoryPath_daemon_profileIdentifier_, a3, a4, a5, a6);
}

@end
