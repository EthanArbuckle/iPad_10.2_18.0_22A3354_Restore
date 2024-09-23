@implementation LAPSFetchOldPasscodeViewControllerOutput

- (LAPSPasscode)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_storeStrong((id *)&self->_passcode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end
