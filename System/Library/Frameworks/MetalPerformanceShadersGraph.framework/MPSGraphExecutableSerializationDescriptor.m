@implementation MPSGraphExecutableSerializationDescriptor

- (MPSGraphExecutableSerializationDescriptor)init
{
  MPSGraphExecutableSerializationDescriptor *v2;
  int active_platform;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSString *minimumDeploymentTarget;
  objc_super v9;
  MPSGraphOperatingSystemVersion v10;

  v9.receiver = self;
  v9.super_class = (Class)MPSGraphExecutableSerializationDescriptor;
  v2 = -[MPSGraphExecutableSerializationDescriptor init](&v9, sel_init);
  active_platform = dyld_get_active_platform();
  v4 = 0;
  switch(active_platform)
  {
    case 1:
      break;
    case 2:
      v4 = 1;
      break;
    case 3:
      v4 = 2;
      break;
    case 11:
      v4 = 3;
      break;
    default:
      if (MTLReportFailureTypeEnabled())
        MTLReportFailure();
      v4 = 0;
      break;
  }
  v2->_deploymentPlatform = v4;
  v5 = atomic_load((unsigned __int8 *)&qword_1EDC0BEF8);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_1EDC0BEF8))
  {
    getMPSGraphBuildSDKVersion(void)::$_0::operator()();
    __cxa_guard_release(&qword_1EDC0BEF8);
  }
  v10 = *(MPSGraphOperatingSystemVersion *)byte_1EDC0BF60;
  MPSGraphOperatingSystemVersion::asString(&v10);
  v6 = objc_claimAutoreleasedReturnValue();
  minimumDeploymentTarget = v2->_minimumDeploymentTarget;
  v2->_minimumDeploymentTarget = (NSString *)v6;

  return v2;
}

- (MPSGraphOperatingSystemVersion)getDeploymentTargetAsOSVersion
{
  MPSGraphOperatingSystemVersion *result;

  MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(retstr, self->_minimumDeploymentTarget);
  return result;
}

- (void)validateMinimumDeploymentTargetForPlatform
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[MPSGraphExecutableSerializationDescriptor getDeploymentTargetAsOSVersion](self, "getDeploymentTargetAsOSVersion");
  switch(self->_deploymentPlatform)
  {
    case 0uLL:
      if (v3 <= 14 && (v3 != 14 || v4 <= 0 && (v4 || v5 < 0)) && MTLReportFailureTypeEnabled())
        goto LABEL_30;
      break;
    case 1uLL:
      if (v3 <= 17 && (v3 != 17 || v4 <= 0 && (v4 || v5 < 0)) && MTLReportFailureTypeEnabled())
        goto LABEL_30;
      break;
    case 2uLL:
      if (v3 <= 17 && (v3 != 17 || v4 <= 0 && (v4 || v5 < 0)) && MTLReportFailureTypeEnabled())
        goto LABEL_30;
      break;
    case 3uLL:
      if (v3 <= 1 && (v3 != 1 || v4 <= 1 && (v4 != 1 || v5 < 0)) && MTLReportFailureTypeEnabled())
LABEL_30:
        MTLReportFailure();
      break;
    default:
      return;
  }
}

- (BOOL)append
{
  return self->_append;
}

- (void)setAppend:(BOOL)append
{
  self->_append = append;
}

- (MPSGraphDeploymentPlatform)deploymentPlatform
{
  return self->_deploymentPlatform;
}

- (void)setDeploymentPlatform:(MPSGraphDeploymentPlatform)deploymentPlatform
{
  self->_deploymentPlatform = deploymentPlatform;
}

- (NSString)minimumDeploymentTarget
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMinimumDeploymentTarget:(NSString *)minimumDeploymentTarget
{
  objc_setProperty_atomic(self, a2, minimumDeploymentTarget, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumDeploymentTarget, 0);
}

@end
