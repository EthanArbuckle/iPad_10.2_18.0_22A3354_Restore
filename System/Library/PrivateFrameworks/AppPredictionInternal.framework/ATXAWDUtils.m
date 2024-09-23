@implementation ATXAWDUtils

+ (int)awdScoreWithScore:(double)a3 type:(unint64_t)a4
{
  double v6;
  double v7;
  NSObject *v8;
  double v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  void *v16;
  uint8_t buf[4];
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 == -31337.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAWDUtils.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("score != _ATXScoreNotSet"));

  }
  +[ATXAWDUtils scoreMultiplierWithInputType:](ATXAWDUtils, "scoreMultiplierWithInputType:", a4);
  v7 = fabs(a3);
  if (v7 < INFINITY || v7 > INFINITY)
  {
    v10 = v6 * a3;
    if (v10 >= -2147483650.0)
    {
      if (v10 <= 2147483650.0)
      {
        v12 = (int)v10;
      }
      else
      {
        __atxlog_handle_default();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          +[ATXAWDUtils awdScoreWithScore:type:].cold.2();

        v12 = 0x7FFFFFFF;
      }
    }
    else
    {
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        +[ATXAWDUtils awdScoreWithScore:type:].cold.1();

      v12 = 0x80000000;
    }
    return v12 - ((double)v12 == -31337.0);
  }
  else
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = a4;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Unexpected nonfinite score input encountered during feedback for scoreType: %lu", buf, 0xCu);
    }

    return (int)-31337.0;
  }
}

+ (double)scoreMultiplierWithInputType:(unint64_t)a3
{
  double result;

  result = 1.0;
  switch(a3)
  {
    case 5uLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x34uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3DuLL:
    case 0x3FuLL:
    case 0x41uLL:
    case 0x44uLL:
    case 0x46uLL:
    case 0x49uLL:
    case 0x4EuLL:
    case 0x4FuLL:
    case 0x50uLL:
    case 0x51uLL:
    case 0x52uLL:
    case 0x53uLL:
    case 0x54uLL:
    case 0x55uLL:
    case 0x56uLL:
    case 0x57uLL:
    case 0x58uLL:
    case 0x59uLL:
    case 0x5AuLL:
    case 0x5BuLL:
    case 0x5CuLL:
    case 0x5DuLL:
    case 0x5EuLL:
    case 0x61uLL:
    case 0x62uLL:
    case 0x63uLL:
    case 0x64uLL:
    case 0x6FuLL:
    case 0x70uLL:
    case 0x71uLL:
    case 0x72uLL:
    case 0x73uLL:
    case 0x74uLL:
    case 0x75uLL:
    case 0x76uLL:
    case 0x77uLL:
    case 0x78uLL:
    case 0x79uLL:
    case 0x7AuLL:
    case 0x7BuLL:
    case 0x7CuLL:
    case 0x7DuLL:
    case 0x81uLL:
    case 0x82uLL:
    case 0x83uLL:
    case 0x88uLL:
    case 0x89uLL:
    case 0x8AuLL:
    case 0x8BuLL:
    case 0x8CuLL:
    case 0x8DuLL:
    case 0x8EuLL:
    case 0x8FuLL:
    case 0x90uLL:
    case 0x91uLL:
    case 0x92uLL:
    case 0x9DuLL:
    case 0x9EuLL:
    case 0x9FuLL:
    case 0xA0uLL:
    case 0xA1uLL:
    case 0xA2uLL:
    case 0xA3uLL:
    case 0xA4uLL:
    case 0xA5uLL:
    case 0xA6uLL:
    case 0xA7uLL:
    case 0xA8uLL:
    case 0xA9uLL:
    case 0xAAuLL:
    case 0xABuLL:
    case 0xACuLL:
    case 0xADuLL:
    case 0xAEuLL:
    case 0xAFuLL:
    case 0xB0uLL:
    case 0xB1uLL:
    case 0xB2uLL:
    case 0xB3uLL:
    case 0xBBuLL:
    case 0xBCuLL:
    case 0xBDuLL:
    case 0xBEuLL:
    case 0xBFuLL:
    case 0xC0uLL:
    case 0xC1uLL:
    case 0xC2uLL:
    case 0xC3uLL:
    case 0xC4uLL:
    case 0xC5uLL:
    case 0xC6uLL:
    case 0xC7uLL:
    case 0xC8uLL:
    case 0xC9uLL:
    case 0xCAuLL:
    case 0xCBuLL:
    case 0xCCuLL:
    case 0xCDuLL:
    case 0xCEuLL:
    case 0xCFuLL:
    case 0xD0uLL:
    case 0xD1uLL:
    case 0xD2uLL:
    case 0xD3uLL:
    case 0xD4uLL:
    case 0xD5uLL:
    case 0xD6uLL:
    case 0xD7uLL:
    case 0xD8uLL:
    case 0xD9uLL:
    case 0xDAuLL:
    case 0xDBuLL:
    case 0xDCuLL:
    case 0xDDuLL:
    case 0xDEuLL:
    case 0xDFuLL:
    case 0xE0uLL:
    case 0xE1uLL:
    case 0xE2uLL:
    case 0xE3uLL:
    case 0xE4uLL:
    case 0xE5uLL:
    case 0xE6uLL:
    case 0xE7uLL:
    case 0xE8uLL:
    case 0xE9uLL:
    case 0xEAuLL:
    case 0xEBuLL:
    case 0xECuLL:
    case 0xEDuLL:
    case 0xEEuLL:
    case 0xEFuLL:
    case 0xF0uLL:
    case 0xF1uLL:
    case 0xF2uLL:
    case 0xF3uLL:
    case 0xF4uLL:
    case 0xF5uLL:
    case 0xF6uLL:
    case 0xF7uLL:
    case 0xF8uLL:
    case 0xF9uLL:
    case 0xFAuLL:
    case 0xFCuLL:
    case 0xFDuLL:
    case 0x100uLL:
    case 0x102uLL:
    case 0x104uLL:
    case 0x105uLL:
    case 0x107uLL:
    case 0x108uLL:
    case 0x109uLL:
    case 0x110uLL:
    case 0x111uLL:
    case 0x112uLL:
    case 0x113uLL:
    case 0x114uLL:
    case 0x115uLL:
    case 0x116uLL:
    case 0x11DuLL:
    case 0x11EuLL:
    case 0x11FuLL:
    case 0x120uLL:
    case 0x121uLL:
    case 0x122uLL:
    case 0x123uLL:
    case 0x124uLL:
    case 0x127uLL:
    case 0x128uLL:
    case 0x129uLL:
    case 0x12AuLL:
    case 0x12BuLL:
    case 0x12CuLL:
    case 0x12DuLL:
    case 0x12EuLL:
    case 0x12FuLL:
    case 0x132uLL:
    case 0x133uLL:
    case 0x134uLL:
    case 0x135uLL:
    case 0x138uLL:
    case 0x139uLL:
    case 0x13AuLL:
    case 0x13BuLL:
    case 0x13CuLL:
    case 0x13DuLL:
    case 0x13EuLL:
    case 0x13FuLL:
    case 0x140uLL:
    case 0x141uLL:
    case 0x142uLL:
    case 0x143uLL:
    case 0x144uLL:
    case 0x145uLL:
    case 0x146uLL:
    case 0x147uLL:
    case 0x148uLL:
    case 0x149uLL:
    case 0x14AuLL:
    case 0x14BuLL:
    case 0x14CuLL:
    case 0x14DuLL:
    case 0x14EuLL:
    case 0x14FuLL:
    case 0x150uLL:
    case 0x151uLL:
    case 0x152uLL:
    case 0x153uLL:
    case 0x154uLL:
    case 0x155uLL:
    case 0x156uLL:
    case 0x157uLL:
    case 0x158uLL:
    case 0x159uLL:
    case 0x15AuLL:
    case 0x15BuLL:
    case 0x15CuLL:
    case 0x15DuLL:
    case 0x15EuLL:
    case 0x15FuLL:
    case 0x160uLL:
    case 0x161uLL:
    case 0x162uLL:
    case 0x168uLL:
    case 0x169uLL:
    case 0x16AuLL:
    case 0x16BuLL:
    case 0x16CuLL:
    case 0x16DuLL:
    case 0x16EuLL:
    case 0x16FuLL:
    case 0x170uLL:
    case 0x171uLL:
    case 0x172uLL:
    case 0x173uLL:
    case 0x174uLL:
    case 0x175uLL:
    case 0x17AuLL:
    case 0x17BuLL:
    case 0x17CuLL:
    case 0x17DuLL:
    case 0x17EuLL:
    case 0x17FuLL:
    case 0x180uLL:
    case 0x185uLL:
    case 0x186uLL:
    case 0x187uLL:
    case 0x188uLL:
    case 0x189uLL:
    case 0x18AuLL:
    case 0x18BuLL:
    case 0x18CuLL:
    case 0x18DuLL:
    case 0x18EuLL:
    case 0x18FuLL:
    case 0x190uLL:
    case 0x191uLL:
    case 0x192uLL:
    case 0x193uLL:
    case 0x194uLL:
    case 0x195uLL:
    case 0x196uLL:
    case 0x197uLL:
    case 0x198uLL:
    case 0x199uLL:
    case 0x19AuLL:
    case 0x19BuLL:
    case 0x19CuLL:
    case 0x19DuLL:
    case 0x19EuLL:
    case 0x19FuLL:
    case 0x1A0uLL:
    case 0x1A1uLL:
    case 0x1A2uLL:
    case 0x1A3uLL:
    case 0x1A4uLL:
    case 0x1A5uLL:
    case 0x1A6uLL:
    case 0x1A7uLL:
    case 0x1A8uLL:
    case 0x1A9uLL:
    case 0x1AAuLL:
    case 0x1ABuLL:
    case 0x1ACuLL:
    case 0x1ADuLL:
    case 0x1AEuLL:
    case 0x1AFuLL:
    case 0x1B0uLL:
    case 0x1B1uLL:
    case 0x1B2uLL:
    case 0x1B3uLL:
    case 0x1B4uLL:
    case 0x1B5uLL:
    case 0x1B6uLL:
    case 0x1B7uLL:
    case 0x1B8uLL:
    case 0x1B9uLL:
    case 0x1BAuLL:
    case 0x1BBuLL:
    case 0x1BCuLL:
    case 0x1BDuLL:
    case 0x1BEuLL:
    case 0x1BFuLL:
    case 0x1C0uLL:
    case 0x1C1uLL:
    case 0x1C2uLL:
    case 0x1C3uLL:
    case 0x1C4uLL:
    case 0x1C5uLL:
    case 0x1C6uLL:
    case 0x1C7uLL:
    case 0x1C8uLL:
    case 0x1C9uLL:
    case 0x1CAuLL:
    case 0x1CBuLL:
    case 0x1CCuLL:
    case 0x1CDuLL:
    case 0x1CEuLL:
    case 0x1CFuLL:
    case 0x1D0uLL:
    case 0x1D1uLL:
    case 0x1D2uLL:
    case 0x1D3uLL:
    case 0x1D4uLL:
    case 0x1D5uLL:
    case 0x1D6uLL:
    case 0x1D7uLL:
    case 0x1D8uLL:
    case 0x1D9uLL:
    case 0x1DAuLL:
    case 0x1DBuLL:
    case 0x1DCuLL:
    case 0x1DDuLL:
    case 0x1DEuLL:
    case 0x1DFuLL:
    case 0x1E0uLL:
    case 0x1E1uLL:
    case 0x1E2uLL:
    case 0x1E3uLL:
    case 0x1E4uLL:
    case 0x1E5uLL:
    case 0x1E6uLL:
    case 0x1E7uLL:
    case 0x1E8uLL:
    case 0x1E9uLL:
    case 0x1EAuLL:
    case 0x1EBuLL:
    case 0x1ECuLL:
    case 0x1EDuLL:
    case 0x1EEuLL:
    case 0x1EFuLL:
    case 0x1F0uLL:
    case 0x1F1uLL:
    case 0x1F2uLL:
    case 0x1F3uLL:
    case 0x1F4uLL:
    case 0x1F5uLL:
    case 0x1F8uLL:
    case 0x1F9uLL:
    case 0x1FAuLL:
    case 0x1FBuLL:
    case 0x1FCuLL:
    case 0x1FDuLL:
    case 0x1FEuLL:
    case 0x1FFuLL:
    case 0x200uLL:
    case 0x201uLL:
    case 0x202uLL:
    case 0x203uLL:
    case 0x204uLL:
    case 0x205uLL:
    case 0x206uLL:
    case 0x207uLL:
    case 0x209uLL:
    case 0x20AuLL:
    case 0x20BuLL:
    case 0x20CuLL:
    case 0x20DuLL:
    case 0x20EuLL:
    case 0x20FuLL:
    case 0x210uLL:
    case 0x211uLL:
    case 0x212uLL:
    case 0x213uLL:
    case 0x214uLL:
    case 0x215uLL:
    case 0x216uLL:
    case 0x217uLL:
    case 0x218uLL:
    case 0x219uLL:
    case 0x21AuLL:
    case 0x21BuLL:
    case 0x21CuLL:
    case 0x21DuLL:
    case 0x21EuLL:
    case 0x21FuLL:
    case 0x220uLL:
    case 0x221uLL:
    case 0x222uLL:
    case 0x223uLL:
    case 0x224uLL:
    case 0x225uLL:
    case 0x226uLL:
    case 0x227uLL:
    case 0x229uLL:
    case 0x22AuLL:
    case 0x22BuLL:
    case 0x22CuLL:
    case 0x22DuLL:
    case 0x22EuLL:
    case 0x22FuLL:
    case 0x230uLL:
    case 0x231uLL:
    case 0x232uLL:
    case 0x233uLL:
    case 0x234uLL:
    case 0x235uLL:
    case 0x236uLL:
    case 0x237uLL:
    case 0x238uLL:
    case 0x239uLL:
    case 0x23AuLL:
    case 0x23BuLL:
    case 0x23CuLL:
    case 0x23DuLL:
    case 0x23EuLL:
    case 0x23FuLL:
    case 0x240uLL:
    case 0x241uLL:
    case 0x242uLL:
    case 0x243uLL:
    case 0x244uLL:
    case 0x245uLL:
    case 0x246uLL:
    case 0x247uLL:
    case 0x248uLL:
    case 0x249uLL:
    case 0x24AuLL:
    case 0x24BuLL:
    case 0x24CuLL:
    case 0x24DuLL:
    case 0x24EuLL:
    case 0x24FuLL:
    case 0x250uLL:
    case 0x251uLL:
    case 0x252uLL:
    case 0x253uLL:
    case 0x254uLL:
    case 0x255uLL:
    case 0x256uLL:
    case 0x257uLL:
    case 0x258uLL:
    case 0x259uLL:
    case 0x25AuLL:
    case 0x25BuLL:
    case 0x25CuLL:
    case 0x25DuLL:
    case 0x25EuLL:
    case 0x25FuLL:
    case 0x260uLL:
    case 0x261uLL:
    case 0x262uLL:
    case 0x263uLL:
    case 0x264uLL:
    case 0x265uLL:
    case 0x266uLL:
    case 0x267uLL:
    case 0x268uLL:
    case 0x269uLL:
    case 0x26AuLL:
    case 0x26BuLL:
    case 0x26CuLL:
    case 0x26DuLL:
    case 0x26EuLL:
    case 0x26FuLL:
    case 0x270uLL:
    case 0x271uLL:
    case 0x272uLL:
    case 0x273uLL:
    case 0x274uLL:
    case 0x275uLL:
    case 0x276uLL:
    case 0x277uLL:
    case 0x278uLL:
    case 0x279uLL:
    case 0x27AuLL:
    case 0x27BuLL:
    case 0x27CuLL:
    case 0x27DuLL:
    case 0x27EuLL:
    case 0x27FuLL:
    case 0x280uLL:
    case 0x281uLL:
    case 0x282uLL:
    case 0x283uLL:
    case 0x284uLL:
    case 0x285uLL:
    case 0x286uLL:
    case 0x287uLL:
    case 0x288uLL:
    case 0x289uLL:
    case 0x28AuLL:
    case 0x28BuLL:
    case 0x28CuLL:
    case 0x28DuLL:
    case 0x28EuLL:
    case 0x28FuLL:
    case 0x290uLL:
    case 0x291uLL:
    case 0x292uLL:
    case 0x293uLL:
    case 0x294uLL:
    case 0x295uLL:
    case 0x296uLL:
    case 0x297uLL:
    case 0x298uLL:
    case 0x299uLL:
    case 0x2A1uLL:
    case 0x2A2uLL:
    case 0x2A3uLL:
    case 0x2A4uLL:
    case 0x2A5uLL:
    case 0x2A6uLL:
    case 0x2A7uLL:
    case 0x2A8uLL:
    case 0x2A9uLL:
    case 0x2AAuLL:
    case 0x2ABuLL:
    case 0x2ACuLL:
    case 0x2ADuLL:
    case 0x2AEuLL:
    case 0x2AFuLL:
    case 0x2B0uLL:
    case 0x2B1uLL:
    case 0x2B2uLL:
    case 0x2B3uLL:
    case 0x2B4uLL:
    case 0x2B5uLL:
    case 0x2B6uLL:
    case 0x2B7uLL:
    case 0x2B8uLL:
    case 0x2B9uLL:
    case 0x2BAuLL:
    case 0x2BBuLL:
    case 0x2BCuLL:
    case 0x2BDuLL:
    case 0x2BEuLL:
    case 0x2BFuLL:
    case 0x2C0uLL:
    case 0x2C1uLL:
    case 0x2C2uLL:
    case 0x2C3uLL:
    case 0x2C4uLL:
    case 0x2C5uLL:
    case 0x2C6uLL:
    case 0x2C7uLL:
    case 0x2C8uLL:
    case 0x2C9uLL:
    case 0x2CAuLL:
    case 0x2CBuLL:
    case 0x2CCuLL:
    case 0x2CDuLL:
    case 0x2CEuLL:
    case 0x2CFuLL:
    case 0x2D0uLL:
    case 0x2D1uLL:
    case 0x2D2uLL:
    case 0x2D3uLL:
    case 0x2D4uLL:
    case 0x2D5uLL:
    case 0x2D6uLL:
    case 0x2D7uLL:
    case 0x2D8uLL:
    case 0x2D9uLL:
    case 0x2DAuLL:
    case 0x2DBuLL:
    case 0x2DCuLL:
    case 0x2DDuLL:
    case 0x2DEuLL:
    case 0x2DFuLL:
    case 0x2E0uLL:
    case 0x2E1uLL:
    case 0x2E2uLL:
    case 0x2E3uLL:
    case 0x2E4uLL:
    case 0x2E5uLL:
    case 0x2E6uLL:
    case 0x2E7uLL:
    case 0x2E8uLL:
    case 0x2E9uLL:
    case 0x2EAuLL:
    case 0x2EBuLL:
    case 0x2ECuLL:
    case 0x2EDuLL:
    case 0x2EEuLL:
    case 0x2EFuLL:
    case 0x2F0uLL:
    case 0x2F1uLL:
    case 0x2F2uLL:
    case 0x2F3uLL:
    case 0x2F4uLL:
    case 0x2F5uLL:
    case 0x2F6uLL:
    case 0x2F7uLL:
    case 0x2F8uLL:
    case 0x2F9uLL:
    case 0x2FAuLL:
    case 0x2FBuLL:
    case 0x2FCuLL:
    case 0x2FDuLL:
    case 0x2FEuLL:
    case 0x2FFuLL:
    case 0x300uLL:
    case 0x302uLL:
    case 0x303uLL:
    case 0x304uLL:
    case 0x305uLL:
    case 0x306uLL:
    case 0x307uLL:
    case 0x308uLL:
    case 0x309uLL:
    case 0x30AuLL:
    case 0x30BuLL:
    case 0x30CuLL:
    case 0x30DuLL:
    case 0x30EuLL:
    case 0x30FuLL:
    case 0x310uLL:
    case 0x311uLL:
    case 0x312uLL:
    case 0x313uLL:
    case 0x314uLL:
    case 0x315uLL:
    case 0x316uLL:
    case 0x317uLL:
    case 0x318uLL:
    case 0x319uLL:
    case 0x31AuLL:
    case 0x31BuLL:
    case 0x31CuLL:
    case 0x31DuLL:
    case 0x31EuLL:
    case 0x31FuLL:
    case 0x320uLL:
    case 0x321uLL:
    case 0x322uLL:
    case 0x323uLL:
    case 0x324uLL:
    case 0x325uLL:
    case 0x326uLL:
    case 0x327uLL:
    case 0x329uLL:
    case 0x32AuLL:
    case 0x32BuLL:
    case 0x32CuLL:
    case 0x330uLL:
      result = 10000.0;
      break;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0x33uLL:
    case 0x3BuLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x40uLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x45uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x4AuLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x5FuLL:
    case 0x60uLL:
    case 0x65uLL:
    case 0x66uLL:
    case 0x67uLL:
    case 0x68uLL:
    case 0x69uLL:
    case 0x6AuLL:
    case 0x6BuLL:
    case 0x6CuLL:
    case 0x6DuLL:
    case 0x6EuLL:
    case 0x7EuLL:
    case 0x7FuLL:
    case 0x80uLL:
    case 0x84uLL:
    case 0x85uLL:
    case 0x86uLL:
    case 0x87uLL:
    case 0x93uLL:
    case 0x94uLL:
    case 0x95uLL:
    case 0x96uLL:
    case 0x97uLL:
    case 0x98uLL:
    case 0x99uLL:
    case 0x9AuLL:
    case 0x9BuLL:
    case 0x9CuLL:
    case 0xB4uLL:
    case 0xB5uLL:
    case 0xB6uLL:
    case 0xB7uLL:
    case 0xB8uLL:
    case 0xB9uLL:
    case 0xBAuLL:
    case 0xFBuLL:
    case 0xFEuLL:
    case 0xFFuLL:
    case 0x101uLL:
    case 0x103uLL:
    case 0x106uLL:
    case 0x10AuLL:
    case 0x10BuLL:
    case 0x10CuLL:
    case 0x10DuLL:
    case 0x10EuLL:
    case 0x10FuLL:
    case 0x117uLL:
    case 0x118uLL:
    case 0x119uLL:
    case 0x11AuLL:
    case 0x11BuLL:
    case 0x11CuLL:
    case 0x125uLL:
    case 0x126uLL:
    case 0x130uLL:
    case 0x131uLL:
    case 0x136uLL:
    case 0x137uLL:
    case 0x163uLL:
    case 0x164uLL:
    case 0x165uLL:
    case 0x166uLL:
    case 0x167uLL:
    case 0x176uLL:
    case 0x177uLL:
    case 0x178uLL:
    case 0x179uLL:
    case 0x181uLL:
    case 0x182uLL:
    case 0x183uLL:
    case 0x184uLL:
    case 0x1F6uLL:
    case 0x1F7uLL:
    case 0x208uLL:
    case 0x228uLL:
    case 0x29AuLL:
    case 0x29BuLL:
    case 0x29CuLL:
    case 0x29DuLL:
    case 0x29EuLL:
    case 0x29FuLL:
    case 0x2A0uLL:
    case 0x301uLL:
    case 0x328uLL:
    case 0x32DuLL:
    case 0x32EuLL:
    case 0x32FuLL:
      return result;
    case 0x331uLL:
      goto LABEL_5;
    default:
      if (a3 == 0xFFFFFFFF)
LABEL_5:
        result = 0.0;
      break;
  }
  return result;
}

+ (id)subscoresWithDictionary:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _UNKNOWN **v13;
  void *v14;
  uint64_t v15;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = (id)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    v8 = &off_1E82D9000;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
        v11 = objc_msgSend(v10, "rangeOfString:", CFSTR("_ATXScoreInput"));
        v12 = v8[128];
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_ATXScoreInput%@"), v10);
          v13 = v8;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "scoreInputForString:", v14);

          v8 = v13;
        }
        else
        {
          v15 = objc_msgSend(v8[128], "scoreInputForString:", v10);
        }
        if (v15 != 817 && v15 != 0xFFFFFFFFLL)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          v19 = v18;

          if (v19 != -31337.0)
          {
            v20 = +[ATXAWDUtils awdScoreWithScore:type:](ATXAWDUtils, "awdScoreWithScore:type:", v15, v19);
            switch(v15)
            {
              case 0:
                objc_msgSend(v23, "setInstallAge:", v20);
                break;
              case 1:
                objc_msgSend(v23, "setLastSpotlightLaunchAge:", v20);
                break;
              case 2:
                objc_msgSend(v23, "setLastLaunchAge:", v20);
                break;
              case 3:
                objc_msgSend(v23, "setMedianSecondsBetweenLaunches:", v20);
                break;
              case 4:
                objc_msgSend(v23, "setAverageSecondsBetweenLaunches:", v20);
                break;
              case 5:
                objc_msgSend(v23, "setUnlockTime:", v20);
                break;
              case 6:
                objc_msgSend(v23, "setAppInFolder:", v20);
                break;
              case 7:
                objc_msgSend(v23, "setFolderPage:", v20);
                break;
              case 9:
                objc_msgSend(v23, "setSpringBoardPage:", v20);
                break;
              case 10:
                objc_msgSend(v23, "setOnSpringBoardDock:", v20);
                break;
              case 11:
                objc_msgSend(v23, "setFeedback:", v20);
                break;
              case 12:
                objc_msgSend(v23, "setFeedbackConfirms:", v20);
                break;
              case 13:
                objc_msgSend(v23, "setFeedbackRejects:", v20);
                break;
              case 26:
                objc_msgSend(v23, "setLaunchTimePopularity:", v20);
                break;
              case 27:
                objc_msgSend(v23, "setTimeOfDayPopularity:", v20);
                break;
              case 28:
                objc_msgSend(v23, "setCoarseTimeOfDayPopularity:", v20);
                break;
              case 29:
                objc_msgSend(v23, "setLaunchPopularity:", v20);
                break;
              case 30:
                objc_msgSend(v23, "setSpotlightLaunchTimePopularity:", v20);
                break;
              case 31:
                objc_msgSend(v23, "setSpotlightTimeOfDayPopularity:", v20);
                break;
              case 32:
                objc_msgSend(v23, "setSpotlightLaunchPopularity:", v20);
                break;
              case 33:
                objc_msgSend(v23, "setDayZeroPoints:", v20);
                break;
              case 34:
                objc_msgSend(v23, "setStaticAppPoints:", v20);
                break;
              case 35:
                objc_msgSend(v23, "setLaunchDayOfWeekPopularity:", v20);
                break;
              case 36:
                objc_msgSend(v23, "setDayOfWeekPopularity:", v20);
                break;
              case 37:
                objc_msgSend(v23, "setLaunchSequencePopularity:", v20);
                break;
              case 38:
                objc_msgSend(v23, "setLaunchLocationPopularity:", v20);
                break;
              case 39:
                objc_msgSend(v23, "setAppLaunchMicroLocationPopularity:", v20);
                break;
              case 40:
                objc_msgSend(v23, "setEntropyLaunchPopularity:", v20);
                break;
              case 41:
                objc_msgSend(v23, "setEntropyDayOfWeekPopularity:", v20);
                break;
              case 42:
                objc_msgSend(v23, "setEntropyDayOfWeekPopularityByDay:", v20);
                break;
              case 43:
                objc_msgSend(v23, "setEntropyDayOfWeekPopularityByApp:", v20);
                break;
              case 44:
                objc_msgSend(v23, "setDistanceDayOfWeekToLaunchPopularity:", v20);
                break;
              case 45:
                objc_msgSend(v23, "setEntropyTrendingPopularity:", v20);
                break;
              case 46:
                objc_msgSend(v23, "setDistanceTrendingToLaunchPopularity:", v20);
                break;
              case 47:
                objc_msgSend(v23, "setEntropySSIDPopularity:", v20);
                break;
              case 48:
                objc_msgSend(v23, "setEntropySSIDPopularityBySSID:", v20);
                break;
              case 49:
                objc_msgSend(v23, "setEntropySSIDPopularityByApp:", v20);
                break;
              case 50:
                objc_msgSend(v23, "setDistanceSSIDToLaunchPopularity:", v20);
                break;
              case 51:
                objc_msgSend(v23, "setAppCount:", v20);
                break;
              case 52:
                objc_msgSend(v23, "setDistanceToExplicitLaunchPrediction:", v20);
                break;
              case 53:
                objc_msgSend(v23, "setSiriKitIntentParzen:", v20);
                break;
              case 54:
                objc_msgSend(v23, "setNonSiriKitIntentParzen:", v20);
                break;
              case 55:
                objc_msgSend(v23, "setAppDailyDose:", v20);
                break;
              case 56:
                objc_msgSend(v23, "setCurrentDose:", v20);
                break;
              case 57:
                objc_msgSend(v23, "setAppDailyDoseRemaining:", v20);
                break;
              case 58:
                objc_msgSend(v23, "setAppDailyDoseSmoothedError:", v20);
                break;
              case 59:
                objc_msgSend(v23, "setTotalNumberOfLaunches:", v20);
                break;
              case 60:
                objc_msgSend(v23, "setTotalNumberOfSpotlightLaunches:", v20);
                break;
              case 61:
                objc_msgSend(v23, "setAirplaneModePopularity:", v20);
                break;
              case 62:
                objc_msgSend(v23, "setTotalNumberOfAirplaneModeLaunches:", v20);
                break;
              case 63:
                objc_msgSend(v23, "setTrendingPopularity:", v20);
                break;
              case 64:
                objc_msgSend(v23, "setTotalNumberOfTrendingLaunches:", v20);
                break;
              case 65:
                objc_msgSend(v23, "setSSIDPopularity:", v20);
                break;
              case 66:
                objc_msgSend(v23, "setTotalNumberOfSSIDLaunches:", v20);
                break;
              case 67:
                objc_msgSend(v23, "setOnWifi:", v20);
                break;
              case 68:
                objc_msgSend(v23, "setCoreMotionPopularity:", v20);
                break;
              case 69:
                objc_msgSend(v23, "setTotalNumberOfCoreMotionLaunches:", v20);
                break;
              case 70:
                objc_msgSend(v23, "setMagicalMomentsConfidence:", v20);
                break;
              case 71:
                objc_msgSend(v23, "setMagicalMomentsPredictionReason:", v20);
                break;
              case 73:
                objc_msgSend(v23, "setHeroAppConfidence:", v20);
                break;
              case 74:
                objc_msgSend(v23, "setHeroAppPredictionReason:", v20);
                break;
              case 75:
                objc_msgSend(v23, "setMagicalMomentsHeroAppPredictionIndex:", v20);
                break;
              case 76:
                objc_msgSend(v23, "setMagicalMomentsHeroAppPredictionTotalPredictions:", v20);
                break;
              case 77:
                objc_msgSend(v23, "setMostRecentNotificationAge:", v20);
                break;
              case 78:
                objc_msgSend(v23, "setAppPreferenceBundleBoost:", v20);
                break;
              case 79:
                objc_msgSend(v23, "setAppIntentPartOfWeekPopularity:", v20);
                break;
              case 80:
                objc_msgSend(v23, "setAppIntentLaunchPartOfWeekPopularity:", v20);
                break;
              case 81:
                objc_msgSend(v23, "setGenreTimeOfDayPopularity:", v20);
                break;
              case 82:
                objc_msgSend(v23, "setGenreSequencePopularity:", v20);
                break;
              case 83:
                objc_msgSend(v23, "setGenreDayOfWeekPopularity:", v20);
                break;
              case 84:
                objc_msgSend(v23, "setGenreSpotlightLaunchPopularity:", v20);
                break;
              case 85:
                objc_msgSend(v23, "setTrendingGenrePopularity:", v20);
                break;
              case 86:
                objc_msgSend(v23, "setGenreAirplaneModePopularity:", v20);
                break;
              case 87:
                objc_msgSend(v23, "setGenreDailyDoseRemaining:", v20);
                break;
              case 88:
                objc_msgSend(v23, "setGenreLocationPopularity:", v20);
                break;
              case 89:
                objc_msgSend(v23, "setGenreSSIDPopularity:", v20);
                break;
              case 90:
                objc_msgSend(v23, "setApp2VecClusterTimeOfDayPopularity:", v20);
                break;
              case 91:
                objc_msgSend(v23, "setApp2VecClusterSequencePopularity:", v20);
                break;
              case 92:
                objc_msgSend(v23, "setApp2VecClusterDayOfWeekPopularity:", v20);
                break;
              case 93:
                objc_msgSend(v23, "setApp2VecClusterTrendingPopularity:", v20);
                break;
              case 94:
                objc_msgSend(v23, "setApp2VecClusterLocationPopularity:", v20);
                break;
              case 95:
                objc_msgSend(v23, "setApp2VecClusterCount:", v20);
                break;
              case 96:
                objc_msgSend(v23, "setSupportsMedia:", v20);
                break;
              case 97:
                objc_msgSend(v23, "setAppTimeAndDayOfWeekPopularity:", v20);
                break;
              case 98:
                objc_msgSend(v23, "setAppPopularityGivenTimeAndDayOfWeek:", v20);
                break;
              case 99:
                objc_msgSend(v23, "setAppPopularityOfTimeAndDayOfWeekGivenApp:", v20);
                break;
              case 100:
                objc_msgSend(v23, "setAppTotalNumberOfTimeAndDayOfWeekLaunches:", v20);
                break;
              case 101:
                objc_msgSend(v23, "setAppIntentCount:", v20);
                break;
              case 102:
                objc_msgSend(v23, "setAppIntentSlotCountForAllAppActions:", v20);
                break;
              case 103:
                objc_msgSend(v23, "setAppIntentTotalNumberOfLaunches:", v20);
                break;
              case 104:
                objc_msgSend(v23, "setAppIntentTotalNumberOfAirplaneModeLaunches:", v20);
                break;
              case 105:
                objc_msgSend(v23, "setAppIntentTotalNumberOfSSIDLaunches:", v20);
                break;
              case 106:
                objc_msgSend(v23, "setAppIntentTotalNumberOfCoreMotionLaunches:", v20);
                break;
              case 107:
                objc_msgSend(v23, "setAppIntentTotalNumberOfTrendingLaunches:", v20);
                break;
              case 108:
                objc_msgSend(v23, "setDayOfWeekBucket:", v20);
                break;
              case 109:
                objc_msgSend(v23, "setTimeOfDayBucket:", v20);
                break;
              case 110:
                objc_msgSend(v23, "setIsDateInWeekendOnDevice:", v20);
                break;
              case 111:
                objc_msgSend(v23, "setAppIntentLaunchPopularity:", v20);
                break;
              case 112:
                objc_msgSend(v23, "setAppIntentTrendingPopularity:", v20);
                break;
              case 113:
                objc_msgSend(v23, "setAppIntentTimeOfDayPopularity:", v20);
                break;
              case 114:
                objc_msgSend(v23, "setAppIntentCoarseTimeOfDayPopularity:", v20);
                break;
              case 115:
                objc_msgSend(v23, "setAppIntentDayOfWeekPopularity:", v20);
                break;
              case 116:
                objc_msgSend(v23, "setAppIntentUnlockTime:", v20);
                break;
              case 117:
                objc_msgSend(v23, "setAppIntentSSIDPopularity:", v20);
                break;
              case 118:
                objc_msgSend(v23, "setAppIntentCoreMotionPopularity:", v20);
                break;
              case 119:
                objc_msgSend(v23, "setAppIntentAirplaneModePopularity:", v20);
                break;
              case 120:
                objc_msgSend(v23, "setAppIntentLaunchLocationPopularity:", v20);
                break;
              case 121:
                objc_msgSend(v23, "setAppIntentLaunchMicroLocationPopularity:", v20);
                break;
              case 122:
                objc_msgSend(v23, "setAppIntentLaunchSequencePopularity:", v20);
                break;
              case 123:
                objc_msgSend(v23, "setAppIntentAppLaunchSequencePopularity:", v20);
                break;
              case 124:
                objc_msgSend(v23, "setAppIntentLaunchTimePopularity:", v20);
                break;
              case 125:
                objc_msgSend(v23, "setAppIntentLaunchDayOfWeekPopularity:", v20);
                break;
              case 126:
                objc_msgSend(v23, "setAppIntentLastLaunchAge:", v20);
                break;
              case 127:
                objc_msgSend(v23, "setAppIntentAverageSecondsBetweenAppActions:", v20);
                break;
              case 128:
                objc_msgSend(v23, "setAppIntentMedianSecondsBetweenAppActions:", v20);
                break;
              case 129:
                objc_msgSend(v23, "setAppIntentDayZeroPoints:", v20);
                break;
              case 130:
                objc_msgSend(v23, "setAppIntentStaticPoints:", v20);
                break;
              case 131:
                objc_msgSend(v23, "setAppIntentValueScore:", v20);
                break;
              case 132:
                objc_msgSend(v23, "setAppCategory:", v20);
                break;
              case 135:
                objc_msgSend(v23, "setIntentCategoryFromIntentDefinition:", v20);
                break;
              case 136:
                objc_msgSend(v23, "setAppIntentEntropyLaunchPopularity:", v20);
                break;
              case 137:
                objc_msgSend(v23, "setAppIntentEntropyDayOfWeekPopularity:", v20);
                break;
              case 138:
                objc_msgSend(v23, "setAppIntentEntropyDayOfWeekPopularityByDay:", v20);
                break;
              case 139:
                objc_msgSend(v23, "setAppIntentEntropyDayOfWeekPopularityByAppIntent:", v20);
                break;
              case 140:
                objc_msgSend(v23, "setAppIntentEntropyTrendingPopularity:", v20);
                break;
              case 141:
                objc_msgSend(v23, "setAppIntentEntropySSIDPopularity:", v20);
                break;
              case 142:
                objc_msgSend(v23, "setAppIntentEntropySSIDPopularityBySSID:", v20);
                break;
              case 143:
                objc_msgSend(v23, "setAppIntentEntropySSIDPopularityByAppIntent:", v20);
                break;
              case 144:
                objc_msgSend(v23, "setAppIntentDistanceDayOfWeekToLaunchPopularity:", v20);
                break;
              case 145:
                objc_msgSend(v23, "setAppIntentDistanceTrendingToLaunchPopularity:", v20);
                break;
              case 146:
                objc_msgSend(v23, "setAppIntentDistanceSSIDToLaunchPopularity:", v20);
                break;
              case 147:
                objc_msgSend(v23, "setAppActionConfirmEvents:", v20);
                break;
              case 148:
                objc_msgSend(v23, "setAppActionRejectEvents:", v20);
                break;
              case 149:
                objc_msgSend(v23, "setTotalAppActionConfirmEvents:", v20);
                break;
              case 150:
                objc_msgSend(v23, "setTotalAppActionRejectEvents:", v20);
                break;
              case 151:
                objc_msgSend(v23, "setAppForAllIntentsCount:", v20);
                break;
              case 152:
                objc_msgSend(v23, "setAppForAllIntentsTotalNumberOfLaunches:", v20);
                break;
              case 153:
                objc_msgSend(v23, "setAppForAllIntentsTotalNumberOfAirplaneModeLaunches:", v20);
                break;
              case 154:
                objc_msgSend(v23, "setAppForAllIntentsTotalNumberOfSSIDLaunches:", v20);
                break;
              case 155:
                objc_msgSend(v23, "setAppForAllIntentsTotalNumberOfCoreMotionLaunches:", v20);
                break;
              case 156:
                objc_msgSend(v23, "setAppForAllIntentsTotalNumberOfTrendingLaunches:", v20);
                break;
              case 157:
                objc_msgSend(v23, "setAppForAllIntentsLaunchPopularity:", v20);
                break;
              case 158:
                objc_msgSend(v23, "setAppForAllIntentsTimeOfDayPopularity:", v20);
                break;
              case 159:
                objc_msgSend(v23, "setAppForAllIntentsDayOfWeekPopularity:", v20);
                break;
              case 160:
                objc_msgSend(v23, "setAppForAllIntentsCoarseTimeOfDayPopularity:", v20);
                break;
              case 161:
                objc_msgSend(v23, "setAppForAllIntentsUnlockTime:", v20);
                break;
              case 162:
                objc_msgSend(v23, "setAppForAllIntentsAirplaneModePopularity:", v20);
                break;
              case 163:
                objc_msgSend(v23, "setAppForAllIntentsSSIDPopularity:", v20);
                break;
              case 164:
                objc_msgSend(v23, "setAppForAllIntentsCoreMotionPopularity:", v20);
                break;
              case 165:
                objc_msgSend(v23, "setAppForAllIntentsTrendingPopularity:", v20);
                break;
              case 166:
                objc_msgSend(v23, "setAppForAllIntentsLaunchLocationPopularity:", v20);
                break;
              case 167:
                objc_msgSend(v23, "setAppForAllIntentsLaunchTimePopularity:", v20);
                break;
              case 168:
                objc_msgSend(v23, "setAppForAllIntentsLaunchDayOfWeekPopularity:", v20);
                break;
              case 169:
                objc_msgSend(v23, "setAppForAllIntentsEntropyLaunchPopularity:", v20);
                break;
              case 170:
                objc_msgSend(v23, "setAppForAllIntentsEntropyDayOfWeekPopularity:", v20);
                break;
              case 171:
                objc_msgSend(v23, "setAppForAllIntentsEntropyDayOfWeekPopularityByDay:", v20);
                break;
              case 172:
                objc_msgSend(v23, "setAppForAllIntentsEntropyDayOfWeekPopularityByApp:", v20);
                break;
              case 173:
                objc_msgSend(v23, "setAppForAllIntentsEntropyTrendingPopularity:", v20);
                break;
              case 174:
                objc_msgSend(v23, "setAppForAllIntentsEntropySSIDPopularity:", v20);
                break;
              case 175:
                objc_msgSend(v23, "setAppForAllIntentsEntropySSIDPopularityBySSID:", v20);
                break;
              case 176:
                objc_msgSend(v23, "setAppForAllIntentsEntropySSIDPopularityByApp:", v20);
                break;
              case 177:
                objc_msgSend(v23, "setAppForAllIntentsDistanceSSIDToLaunchPopularity:", v20);
                break;
              case 178:
                objc_msgSend(v23, "setAppForAllIntentsDistanceDayOfWeekToLaunchPopularity:", v20);
                break;
              case 179:
                objc_msgSend(v23, "setAppForAllIntentsDistanceTrendingToLaunchPopularity:", v20);
                break;
              case 180:
                objc_msgSend(v23, "setAppForAllActionsConfirmEvents:", v20);
                break;
              case 181:
                objc_msgSend(v23, "setAppForAllActionsRejectEvents:", v20);
                break;
              case 182:
                objc_msgSend(v23, "setTotalAppForAllActionsConfirmEvents:", v20);
                break;
              case 183:
                objc_msgSend(v23, "setTotalAppForAllActionsRejectEvents:", v20);
                break;
              case 184:
                objc_msgSend(v23, "setSlotCount:", v20);
                break;
              case 185:
                objc_msgSend(v23, "setSlotTotalNumberOfLaunches:", v20);
                break;
              case 186:
                objc_msgSend(v23, "setSlotTotalNumberOfUniqueDaysLaunched:", v20);
                break;
              case 187:
                objc_msgSend(v23, "setSlotLaunchPopularity:", v20);
                break;
              case 188:
                objc_msgSend(v23, "setSlotTimeOfDayPopularity:", v20);
                break;
              case 189:
                objc_msgSend(v23, "setSlotTimeOfDayWithThirtyMinuteWindowPopularity:", v20);
                break;
              case 190:
                objc_msgSend(v23, "setSlotTimeOfDayWithHourWindowPopularity:", v20);
                break;
              case 191:
                objc_msgSend(v23, "setSlotTimeOfDayWithEightHourWindowPopularity:", v20);
                break;
              case 192:
                objc_msgSend(v23, "setSlotDayOfWeekPopularity:", v20);
                break;
              case 193:
                objc_msgSend(v23, "setSlotPartOfWeekPopularity:", v20);
                break;
              case 194:
                objc_msgSend(v23, "setSlotPartOfWeekAndLocationPopularity:", v20);
                break;
              case 195:
                objc_msgSend(v23, "setSlotCoarseTimeOfDayPopularity:", v20);
                break;
              case 196:
                objc_msgSend(v23, "setSlotLocationPopularity:", v20);
                break;
              case 197:
                objc_msgSend(v23, "setSlotCoreMotionPopularity:", v20);
                break;
              case 198:
                objc_msgSend(v23, "setSlotPreviousLocationPopularity:", v20);
                break;
              case 199:
                objc_msgSend(v23, "setSlotTimeAndDayPopularity:", v20);
                break;
              case 200:
                objc_msgSend(v23, "setSlotTimeAndLocationPopularity:", v20);
                break;
              case 201:
                objc_msgSend(v23, "setSlotDayAndLocationPopularity:", v20);
                break;
              case 202:
                objc_msgSend(v23, "setSlotTimeAndDayAndLocationPopularity:", v20);
                break;
              case 203:
                objc_msgSend(v23, "setSlotPreviousLocationAndCoreMotionPopularity:", v20);
                break;
              case 204:
                objc_msgSend(v23, "setSlotPreviousLocationAndLocationPopularity:", v20);
                break;
              case 205:
                objc_msgSend(v23, "setSlotTimeAndPreviousLocationPopularity:", v20);
                break;
              case 206:
                objc_msgSend(v23, "setSlotDayAndPreviousLocationPopularity:", v20);
                break;
              case 207:
                objc_msgSend(v23, "setSlotPartOfWeekAndTimePopularity:", v20);
                break;
              case 208:
                objc_msgSend(v23, "setSlotLaunchTimePopularity:", v20);
                break;
              case 209:
                objc_msgSend(v23, "setSlotLaunchCoarseTimePopularity:", v20);
                break;
              case 210:
                objc_msgSend(v23, "setSlotLaunchDayOfWeekPopularity:", v20);
                break;
              case 211:
                objc_msgSend(v23, "setSlotLaunchPartOfWeekPopularity:", v20);
                break;
              case 212:
                objc_msgSend(v23, "setSlotLaunchPartOfWeekAndLocationPopularity:", v20);
                break;
              case 213:
                objc_msgSend(v23, "setSlotLaunchLocationPopularity:", v20);
                break;
              case 214:
                objc_msgSend(v23, "setSlotLaunchCoreMotionPopularity:", v20);
                break;
              case 215:
                objc_msgSend(v23, "setSlotLaunchPreviousLocationPopularity:", v20);
                break;
              case 216:
                objc_msgSend(v23, "setSlotLaunchTimeAndDayPopularity:", v20);
                break;
              case 217:
                objc_msgSend(v23, "setSlotLaunchTimeAndLocationPopularity:", v20);
                break;
              case 218:
                objc_msgSend(v23, "setSlotLaunchDayAndLocationPopularity:", v20);
                break;
              case 219:
                objc_msgSend(v23, "setSlotLaunchTimeAndDayAndLocationPopularity:", v20);
                break;
              case 220:
                objc_msgSend(v23, "setSlotLaunchPreviousLocationAndCoreMotionPopularity:", v20);
                break;
              case 221:
                objc_msgSend(v23, "setSlotLaunchPreviousLocationAndLocationPopularity:", v20);
                break;
              case 222:
                objc_msgSend(v23, "setSlotLaunchTimeAndPreviousLocationPopularity:", v20);
                break;
              case 223:
                objc_msgSend(v23, "setSlotLaunchDayAndPreviousLocationPopularity:", v20);
                break;
              case 224:
                objc_msgSend(v23, "setSlotLaunchPartOfWeekAndTimePopularity:", v20);
                break;
              case 225:
                objc_msgSend(v23, "setSlotLaunchTimeCount:", v20);
                break;
              case 226:
                objc_msgSend(v23, "setSlotLaunchDayOfWeekCount:", v20);
                break;
              case 227:
                objc_msgSend(v23, "setSlotLaunchPartOfWeekCount:", v20);
                break;
              case 228:
                objc_msgSend(v23, "setSlotLaunchCoarseTimeCount:", v20);
                break;
              case 229:
                objc_msgSend(v23, "setSlotLaunchTimeWithThirtyMinuteWindowCount:", v20);
                break;
              case 230:
                objc_msgSend(v23, "setSlotLaunchTimeWithHourWindowCount:", v20);
                break;
              case 231:
                objc_msgSend(v23, "setSlotLaunchTimeWithEightHourWindowCount:", v20);
                break;
              case 232:
                objc_msgSend(v23, "setSlotLaunchLocationCount:", v20);
                break;
              case 233:
                objc_msgSend(v23, "setSlotLaunchCoreMotionCount:", v20);
                break;
              case 234:
                objc_msgSend(v23, "setSlotLaunchPreviousLocationCount:", v20);
                break;
              case 235:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingTimeDecay:", v20);
                break;
              case 236:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingDayOfWeekDecay:", v20);
                break;
              case 237:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingLocationDecay:", v20);
                break;
              case 238:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingCoreMotionDecay:", v20);
                break;
              case 239:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingPreviousLocationDecay:", v20);
                break;
              case 240:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingPartOfWeekDecay:", v20);
                break;
              case 241:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingTimeAndDayDecay:", v20);
                break;
              case 242:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingTimeAndLocationDecay:", v20);
                break;
              case 243:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingDayAndLocationDecay:", v20);
                break;
              case 244:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingTimeAndDayAndLocationDecay:", v20);
                break;
              case 245:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingPreviousLocationAndLocationDecay:", v20);
                break;
              case 246:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingPreviousLocationAndCoreMotionDecay:", v20);
                break;
              case 247:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingTimeAndPreviousLocationDecay:", v20);
                break;
              case 248:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingDayAndPreviousLocationDecay:", v20);
                break;
              case 249:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingPartOfWeekAndLocationDecay:", v20);
                break;
              case 250:
                objc_msgSend(v23, "setTotalLaunchesForSlotUsingPartOfWeekAndTimeDecay:", v20);
                break;
              case 251:
                objc_msgSend(v23, "setSlotSecondsSinceLastSlot:", v20);
                break;
              case 252:
                objc_msgSend(v23, "setSlotOnlyLaunchedWithinShortTimeSpan:", v20);
                break;
              case 253:
                objc_msgSend(v23, "setSlotTotalNumberOfUndecayedLaunchesForSlot:", v20);
                break;
              case 254:
                objc_msgSend(v23, "setSlotNumberOfUniqueDaysLaunchedForSlot:", v20);
                break;
              case 255:
                objc_msgSend(v23, "setSlotTotalNumberOfLaunchesForSlot:", v20);
                break;
              case 256:
                objc_msgSend(v23, "setSlotLOIBoost:", v20);
                break;
              case 257:
                objc_msgSend(v23, "setSlotNumberOfParameters:", v20);
                break;
              case 258:
                objc_msgSend(v23, "setSlotNumSessionStartsForRootOfApp:", v20);
                break;
              case 259:
                objc_msgSend(v23, "setSlotTotalNumSessionsForRootOfApp:", v20);
                break;
              case 260:
                objc_msgSend(v23, "setSlotNumDocFreqForRootOfApp:", v20);
                break;
              case 261:
                objc_msgSend(v23, "setSlotEntropyForSlotSet:", v20);
                break;
              case 262:
                objc_msgSend(v23, "setSlotTotalNumberOfLaunchesForSlotSet:", v20);
                break;
              case 263:
                objc_msgSend(v23, "setSlotTimeOfDayBudgetMeanForSlot:", v20);
                break;
              case 264:
                objc_msgSend(v23, "setSlotTimeOfDayBudgetStdDevForSlot:", v20);
                break;
              case 265:
                objc_msgSend(v23, "setSlotTodaysTimeOfDayBudgetForSlot:", v20);
                break;
              case 266:
                objc_msgSend(v23, "setSlotFeedbackTotalConfirmsForSlot:", v20);
                break;
              case 267:
                objc_msgSend(v23, "setSlotFeedbackTotalRejectsForSlot:", v20);
                break;
              case 268:
                objc_msgSend(v23, "setSlotFeedbackTotalExplicitRejectsForSlotNoDecay:", v20);
                break;
              case 269:
                objc_msgSend(v23, "setSlotFeedbackTotalConfirmsForAllSlots:", v20);
                break;
              case 270:
                objc_msgSend(v23, "setSlotFeedbackTotalRejectsForAllSlots:", v20);
                break;
              case 271:
                objc_msgSend(v23, "setSlotFeedbackTotalExplicitRejectsForAllSlotsNoDecay:", v20);
                break;
              case 272:
                objc_msgSend(v23, "setSlotFeedbackConfirmRatio:", v20);
                break;
              case 273:
                objc_msgSend(v23, "setSlotFeedbackConfirmRatioStdDev:", v20);
                break;
              case 274:
                objc_msgSend(v23, "setSlotFeedbackConfirmRatioMean:", v20);
                break;
              case 275:
                objc_msgSend(v23, "setSlotFeedbackConfirmRatioCount:", v20);
                break;
              case 276:
                objc_msgSend(v23, "setSlotFeedbackMinutesSinceLastExplicitRejectInHomeScreen:", v20);
                break;
              case 277:
                objc_msgSend(v23, "setSlotFeedbackMinutesSinceLastConfirmInSpotlight:", v20);
                break;
              case 278:
                objc_msgSend(v23, "setSlotFeedbackMinutesSinceLastExplicitRejectInSpotlight:", v20);
                break;
              case 279:
                objc_msgSend(v23, "setSlotFeedbackTotalConfirmsForSlotInLastHourInSpotlight:", v20);
                break;
              case 280:
                objc_msgSend(v23, "setSlotFeedbackTotalRejectsForSlotInLastHourInSpotlight:", v20);
                break;
              case 281:
                objc_msgSend(v23, "setSlotFeedbackTotalConfirmsForSlotInLastTwoHoursInSpotlight:", v20);
                break;
              case 282:
                objc_msgSend(v23, "setSlotFeedbackTotalRejectsForSlotInLastTwoHoursInSpotlight:", v20);
                break;
              case 283:
                objc_msgSend(v23, "setSlotFeedbackTotalConfirmsForSlotTodayInSpotlight:", v20);
                break;
              case 284:
                objc_msgSend(v23, "setSlotFeedbackTotalRejectsForSlotTodayInSpotlight:", v20);
                break;
              case 285:
                objc_msgSend(v23, "setSlotFeedbackTotalConfirmsForSlotInSpotlight:", v20);
                break;
              case 286:
                objc_msgSend(v23, "setSlotFeedbackTotalRejectsForSlotInSpotlight:", v20);
                break;
              case 287:
                objc_msgSend(v23, "setSlotFeedbackConfirmsPartOfWeekCountInSpotlight:", v20);
                break;
              case 288:
                objc_msgSend(v23, "setSlotFeedbackConfirmsDayCountInSpotlight:", v20);
                break;
              case 289:
                objc_msgSend(v23, "setSlotFeedbackConfirmsTimeOfDayCountInSpotlight:", v20);
                break;
              case 290:
                objc_msgSend(v23, "setSlotFeedbackConfirmsCoarseTimeOfDayCountInSpotlight:", v20);
                break;
              case 291:
                objc_msgSend(v23, "setSlotFeedbackTotalConfirmsInSpotlightForAllSlots:", v20);
                break;
              case 292:
                objc_msgSend(v23, "setSlotFeedbackTotalRejectsInSpotlightForAllSlots:", v20);
                break;
              case 293:
                objc_msgSend(v23, "setSlotFeedbackTotalConfirmsForSlotTodayInLockscreen:", v20);
                break;
              case 294:
                objc_msgSend(v23, "setSlotFeedbackTotalRejectsForSlotTodayInLockscreen:", v20);
                break;
              case 295:
                objc_msgSend(v23, "setSlotFeedbackMinutesSinceLastConfirmInLockscreen:", v20);
                break;
              case 296:
                objc_msgSend(v23, "setSlotFeedbackMinutesSinceLastRejectInLockscreen:", v20);
                break;
              case 297:
                objc_msgSend(v23, "setSlotFeedbackMinutesSinceLastExplicitRejectInLockscreen:", v20);
                break;
              case 298:
                objc_msgSend(v23, "setSlotFeedbackTotalConfirmsForSlotInLockscreen:", v20);
                break;
              case 299:
                objc_msgSend(v23, "setSlotFeedbackTotalRejectsForSlotInLockscreen:", v20);
                break;
              case 300:
                objc_msgSend(v23, "setSlotFeedbackConfirmsPartOfWeekCountInLockscreen:", v20);
                break;
              case 301:
                objc_msgSend(v23, "setSlotFeedbackConfirmsDayCountInLockscreen:", v20);
                break;
              case 302:
                objc_msgSend(v23, "setSlotFeedbackConfirmsTimeOfDayCountInLockscreen:", v20);
                break;
              case 303:
                objc_msgSend(v23, "setSlotFeedbackConfirmsCoarseTimeOfDayCountInLockscreen:", v20);
                break;
              case 304:
                objc_msgSend(v23, "setSlotFeedbackTotalConfirmsTodayInLockscreenForAllSlots:", v20);
                break;
              case 305:
                objc_msgSend(v23, "setSlotFeedbackTotalRejectsTodayInLockscreenForAllSlots:", v20);
                break;
              case 306:
                objc_msgSend(v23, "setSlotFeedbackTotalConfirmsInLockscreenForAllSlots:", v20);
                break;
              case 307:
                objc_msgSend(v23, "setSlotFeedbackTotalRejectsInLockscreenForAllSlots:", v20);
                break;
              case 308:
                objc_msgSend(v23, "setActionFeedbackTotalConfirmsInSpotlight:", v20);
                break;
              case 309:
                objc_msgSend(v23, "setActionFeedbackTotalRejectsInSpotlight:", v20);
                break;
              case 310:
                objc_msgSend(v23, "setActionFeedbackTotalConfirmsTodayInLockscreen:", v20);
                break;
              case 311:
                objc_msgSend(v23, "setActionFeedbackTotalRejectsTodayInLockscreen:", v20);
                break;
              case 312:
                objc_msgSend(v23, "setActionFeedbackTotalConfirmsInLockscreen:", v20);
                break;
              case 313:
                objc_msgSend(v23, "setActionFeedbackTotalRejectsInLockscreen:", v20);
                break;
              case 314:
                objc_msgSend(v23, "setActionFeedbackMeanNumberOfSpotlightLaunchesPerDay:", v20);
                break;
              case 315:
                objc_msgSend(v23, "setActionFeedbackMeanNumberOfSpotlightConfirmsPerDay:", v20);
                break;
              case 316:
                objc_msgSend(v23, "setActionLaunchPopularity:", v20);
                break;
              case 317:
                objc_msgSend(v23, "setActionTimeOfDayPopularity:", v20);
                break;
              case 318:
                objc_msgSend(v23, "setActionTimeOfDayWithThirtyMinuteWindowPopularity:", v20);
                break;
              case 319:
                objc_msgSend(v23, "setActionTimeOfDayWithHourWindowPopularity:", v20);
                break;
              case 320:
                objc_msgSend(v23, "setActionTimeOfDayWithEightHourWindowPopularity:", v20);
                break;
              case 321:
                objc_msgSend(v23, "setActionCoarseTimeOfDayPopularity:", v20);
                break;
              case 322:
                objc_msgSend(v23, "setActionDayOfWeekPopularity:", v20);
                break;
              case 323:
                objc_msgSend(v23, "setActionPartOfWeekPopularity:", v20);
                break;
              case 324:
                objc_msgSend(v23, "setActionPartOfWeekAndLocationPopularity:", v20);
                break;
              case 325:
                objc_msgSend(v23, "setActionLocationPopularity:", v20);
                break;
              case 326:
                objc_msgSend(v23, "setActionCoreMotionPopularity:", v20);
                break;
              case 327:
                objc_msgSend(v23, "setActionPreviousLocationPopularity:", v20);
                break;
              case 328:
                objc_msgSend(v23, "setActionPreviousLocationAndCoreMotionPopularity:", v20);
                break;
              case 329:
                objc_msgSend(v23, "setActionPreviousLocationAndLocationPopularity:", v20);
                break;
              case 330:
                objc_msgSend(v23, "setActionTimeAndPreviousLocationPopularity:", v20);
                break;
              case 331:
                objc_msgSend(v23, "setActionDayAndPreviousLocationPopularity:", v20);
                break;
              case 332:
                objc_msgSend(v23, "setActionTimeAndDayPopularity:", v20);
                break;
              case 333:
                objc_msgSend(v23, "setActionTimeAndLocationPopularity:", v20);
                break;
              case 334:
                objc_msgSend(v23, "setActionDayAndLocationPopularity:", v20);
                break;
              case 335:
                objc_msgSend(v23, "setActionTimeAndDayAndLocationPopularity:", v20);
                break;
              case 336:
                objc_msgSend(v23, "setActionPartOfWeekAndTimePopularity:", v20);
                break;
              case 337:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingTimeDecay:", v20);
                break;
              case 338:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingDayOfWeekDecay:", v20);
                break;
              case 339:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingLocationDecay:", v20);
                break;
              case 340:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingCoreMotionDecay:", v20);
                break;
              case 341:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingPreviousLocationDecay:", v20);
                break;
              case 342:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingPartOfWeekDecay:", v20);
                break;
              case 343:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingPreviousLocationAndCoreMotionDecay:", v20);
                break;
              case 344:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingPreviousLocationAndLocationDecay:", v20);
                break;
              case 345:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingTimeAndPreviousLocationDecay:", v20);
                break;
              case 346:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingDayAndPreviousLocationDecay:", v20);
                break;
              case 347:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingTimeAndDayDecay:", v20);
                break;
              case 348:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingTimeAndLocationDecay:", v20);
                break;
              case 349:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingDayAndLocationDecay:", v20);
                break;
              case 350:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingTimeAndDayAndLocationDecay:", v20);
                break;
              case 351:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingPartOfWeekAndLocationDecay:", v20);
                break;
              case 352:
                objc_msgSend(v23, "setTotalLaunchesForAllActionsUsingPartOfWeekAndTimeDecay:", v20);
                break;
              case 353:
                objc_msgSend(v23, "setRandomSessionValue:", v20);
                break;
              case 354:
                objc_msgSend(v23, "setRandomScore:", v20);
                break;
              case 355:
                objc_msgSend(v23, "setActionTotalConfirms:", v20);
                break;
              case 356:
                objc_msgSend(v23, "setActionTotalRejects:", v20);
                break;
              case 357:
                objc_msgSend(v23, "setActionTotalExplicitRejectsNoDecay:", v20);
                break;
              case 360:
                objc_msgSend(v23, "setAppGlobalScoreGivenTimeDayLocationAndLastApp:", v20);
                break;
              case 361:
                objc_msgSend(v23, "setAppGlobalScoreGivenTimeDayAndLocation:", v20);
                break;
              case 362:
                objc_msgSend(v23, "setAppLOITypeLaunches:", v20);
                break;
              case 363:
                objc_msgSend(v23, "setAppLastAppLaunches:", v20);
                break;
              case 364:
                objc_msgSend(v23, "setAppTimeOfDayLaunches:", v20);
                break;
              case 365:
                objc_msgSend(v23, "setAppDayOfWeekLaunches:", v20);
                break;
              case 366:
                objc_msgSend(v23, "setAppBlendedLOITypePopularity:", v20);
                break;
              case 367:
                objc_msgSend(v23, "setAppBlendedLastAppPopularity:", v20);
                break;
              case 368:
                objc_msgSend(v23, "setAppBlendedTimeOfDayPopularity:", v20);
                break;
              case 369:
                objc_msgSend(v23, "setAppBlendedDayOfWeekPopularity:", v20);
                break;
              case 370:
                objc_msgSend(v23, "setAppBlendedLOITypeSampledPopularity:", v20);
                break;
              case 371:
                objc_msgSend(v23, "setAppBlendedLastAppSampledPopularity:", v20);
                break;
              case 372:
                objc_msgSend(v23, "setAppBlendedTimeOfDaySampledPopularity:", v20);
                break;
              case 373:
                objc_msgSend(v23, "setAppBlendedDayOfWeekSampledPopularity:", v20);
                break;
              case 374:
                objc_msgSend(v23, "setActionIsFutureMedia:", v20);
                break;
              case 375:
                objc_msgSend(v23, "setActionIsBackgroundExecutable:", v20);
                break;
              case 376:
                objc_msgSend(v23, "setActionCoreMotionType:", v20);
                break;
              case 377:
                objc_msgSend(v23, "setActionLOIType:", v20);
                break;
              case 378:
                objc_msgSend(v23, "setSlotIsSiriKitIntent:", v20);
                break;
              case 379:
                objc_msgSend(v23, "setSlotIsCustomIntent:", v20);
                break;
              case 380:
                objc_msgSend(v23, "setSlotIsNSUserActivity:", v20);
                break;
              case 381:
                objc_msgSend(v23, "setAppActionScore:", v20);
                break;
              case 382:
                objc_msgSend(v23, "setAppActionLogProbability:", v20);
                break;
              case 383:
                objc_msgSend(v23, "setSlotScore:", v20);
                break;
              case 384:
                objc_msgSend(v23, "setSlotLogProbability:", v20);
                break;
              case 385:
                objc_msgSend(v23, "setActionHeuristicConfirmEvents:", v20);
                break;
              case 386:
                objc_msgSend(v23, "setActionHeuristicRejectEvents:", v20);
                break;
              case 387:
                objc_msgSend(v23, "setTotalActionHeuristicConfirmEvents:", v20);
                break;
              case 388:
                objc_msgSend(v23, "setTotalActionHeuristicRejectEvents:", v20);
                break;
              case 389:
                objc_msgSend(v23, "setAmbientLightTypePopularity:", v20);
                break;
              case 390:
                objc_msgSend(v23, "setAmbientLightTypeLaunchPopularity:", v20);
                break;
              case 391:
                objc_msgSend(v23, "setAppIntentAmbientLightTypePopularity:", v20);
                break;
              case 392:
                objc_msgSend(v23, "setAppIntentAmbientLightTypeLaunchPopularity:", v20);
                break;
              case 393:
                objc_msgSend(v23, "setAppLaunchesCoarseTimePowLocationForAppInContext:", v20);
                break;
              case 394:
                objc_msgSend(v23, "setAppLaunchesCoarseTimePowLocationInContext:", v20);
                break;
              case 395:
                objc_msgSend(v23, "setAppLaunchesCoarseTimePowLocationForApp:", v20);
                break;
              case 396:
                objc_msgSend(v23, "setAppLaunchesCoarseTimePowLocationForAllAppsAndContexts:", v20);
                break;
              case 397:
                objc_msgSend(v23, "setAppConfirmsCoarseTimePowLocationForAppInContext:", v20);
                break;
              case 398:
                objc_msgSend(v23, "setAppConfirmsCoarseTimePowLocationInContext:", v20);
                break;
              case 399:
                objc_msgSend(v23, "setAppConfirmsCoarseTimePowLocationForApp:", v20);
                break;
              case 400:
                objc_msgSend(v23, "setAppConfirmsCoarseTimePowLocationForAllAppsAndContexts:", v20);
                break;
              case 401:
                objc_msgSend(v23, "setAppRejectsCoarseTimePowLocationForAppInContext:", v20);
                break;
              case 402:
                objc_msgSend(v23, "setAppRejectsCoarseTimePowLocationInContext:", v20);
                break;
              case 403:
                objc_msgSend(v23, "setAppRejectsCoarseTimePowLocationForApp:", v20);
                break;
              case 404:
                objc_msgSend(v23, "setAppRejectsCoarseTimePowLocationForAllAppsAndContexts:", v20);
                break;
              case 405:
                objc_msgSend(v23, "setAppExplicitRejectsCoarseTimePowLocationForAppInContext:", v20);
                break;
              case 406:
                objc_msgSend(v23, "setAppExplicitRejectsCoarseTimePowLocationInContext:", v20);
                break;
              case 407:
                objc_msgSend(v23, "setAppExplicitRejectsCoarseTimePowLocationForApp:", v20);
                break;
              case 408:
                objc_msgSend(v23, "setAppExplicitRejectsCoarseTimePowLocationForAllAppsAndContexts:", v20);
                break;
              case 409:
                objc_msgSend(v23, "setAppLaunchesSpecificTimeDowLocationForAppInContext:", v20);
                break;
              case 410:
                objc_msgSend(v23, "setAppLaunchesSpecificTimeDowLocationInContext:", v20);
                break;
              case 411:
                objc_msgSend(v23, "setAppLaunchesSpecificTimeDowLocationForApp:", v20);
                break;
              case 412:
                objc_msgSend(v23, "setAppLaunchesSpecificTimeDowLocationForAllAppsAndContexts:", v20);
                break;
              case 413:
                objc_msgSend(v23, "setAppConfirmsSpecificTimeDowLocationForAppInContext:", v20);
                break;
              case 414:
                objc_msgSend(v23, "setAppConfirmsSpecificTimeDowLocationInContext:", v20);
                break;
              case 415:
                objc_msgSend(v23, "setAppConfirmsSpecificTimeDowLocationForApp:", v20);
                break;
              case 416:
                objc_msgSend(v23, "setAppConfirmsSpecificTimeDowLocationForAllAppsAndContexts:", v20);
                break;
              case 417:
                objc_msgSend(v23, "setAppRejectsSpecificTimeDowLocationForAppInContext:", v20);
                break;
              case 418:
                objc_msgSend(v23, "setAppRejectsSpecificTimeDowLocationInContext:", v20);
                break;
              case 419:
                objc_msgSend(v23, "setAppRejectsSpecificTimeDowLocationForApp:", v20);
                break;
              case 420:
                objc_msgSend(v23, "setAppRejectsSpecificTimeDowLocationForAllAppsAndContexts:", v20);
                break;
              case 421:
                objc_msgSend(v23, "setActionsCoarseTimePowLocationForActionInContext:", v20);
                break;
              case 422:
                objc_msgSend(v23, "setActionsCoarseTimePowLocationInContext:", v20);
                break;
              case 423:
                objc_msgSend(v23, "setActionsCoarseTimePowLocationForAction:", v20);
                break;
              case 424:
                objc_msgSend(v23, "setActionsCoarseTimePowLocationForAllActionsAndContexts:", v20);
                break;
              case 425:
                objc_msgSend(v23, "setActionConfirmsCoarseTimePowLocationForActionInContext:", v20);
                break;
              case 426:
                objc_msgSend(v23, "setActionConfirmsCoarseTimePowLocationInContext:", v20);
                break;
              case 427:
                objc_msgSend(v23, "setActionConfirmsCoarseTimePowLocationForAction:", v20);
                break;
              case 428:
                objc_msgSend(v23, "setActionConfirmsCoarseTimePowLocationForAllActionsAndContexts:", v20);
                break;
              case 429:
                objc_msgSend(v23, "setActionRejectsCoarseTimePowLocationForActionInContext:", v20);
                break;
              case 430:
                objc_msgSend(v23, "setActionRejectsCoarseTimePowLocationInContext:", v20);
                break;
              case 431:
                objc_msgSend(v23, "setActionRejectsCoarseTimePowLocationForAction:", v20);
                break;
              case 432:
                objc_msgSend(v23, "setActionRejectsCoarseTimePowLocationForAllActionsAndContexts:", v20);
                break;
              case 433:
                objc_msgSend(v23, "setActionsSpecificTimeDowLocationForActionInContext:", v20);
                break;
              case 434:
                objc_msgSend(v23, "setActionsSpecificTimeDowLocationInContext:", v20);
                break;
              case 435:
                objc_msgSend(v23, "setActionsSpecificTimeDowLocationForAction:", v20);
                break;
              case 436:
                objc_msgSend(v23, "setActionsSpecificTimeDowLocationForAllActionsAndContexts:", v20);
                break;
              case 437:
                objc_msgSend(v23, "setActionConfirmsSpecificTimeDowLocationForActionInContext:", v20);
                break;
              case 438:
                objc_msgSend(v23, "setActionConfirmsSpecificTimeDowLocationInContext:", v20);
                break;
              case 439:
                objc_msgSend(v23, "setActionConfirmsSpecificTimeDowLocationForAction:", v20);
                break;
              case 440:
                objc_msgSend(v23, "setActionConfirmsSpecificTimeDowLocationForAllActionsAndContexts:", v20);
                break;
              case 441:
                objc_msgSend(v23, "setActionRejectsSpecificTimeDowLocationForActionInContext:", v20);
                break;
              case 442:
                objc_msgSend(v23, "setActionRejectsSpecificTimeDowLocationInContext:", v20);
                break;
              case 443:
                objc_msgSend(v23, "setActionRejectsSpecificTimeDowLocationForAction:", v20);
                break;
              case 444:
                objc_msgSend(v23, "setActionRejectsSpecificTimeDowLocationForAllActionsAndContexts:", v20);
                break;
              case 445:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket0ForApp:", v20);
                break;
              case 446:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket1ForApp:", v20);
                break;
              case 447:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket2ForApp:", v20);
                break;
              case 448:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket3ForApp:", v20);
                break;
              case 449:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket4ForApp:", v20);
                break;
              case 450:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket5ForApp:", v20);
                break;
              case 451:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket6ForApp:", v20);
                break;
              case 452:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket7ForApp:", v20);
                break;
              case 453:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket8ForApp:", v20);
                break;
              case 454:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket9ForApp:", v20);
                break;
              case 455:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket10ForApp:", v20);
                break;
              case 456:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket11ForApp:", v20);
                break;
              case 457:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket12ForApp:", v20);
                break;
              case 458:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket13ForApp:", v20);
                break;
              case 459:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket14ForApp:", v20);
                break;
              case 460:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket15ForApp:", v20);
                break;
              case 461:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket16ForApp:", v20);
                break;
              case 462:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket17ForApp:", v20);
                break;
              case 463:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket18ForApp:", v20);
                break;
              case 464:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket19ForApp:", v20);
                break;
              case 465:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket20ForApp:", v20);
                break;
              case 466:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket21ForApp:", v20);
                break;
              case 467:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket22ForApp:", v20);
                break;
              case 468:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket23ForApp:", v20);
                break;
              case 469:
                objc_msgSend(v23, "setAppLaunchesInTimeBucket24ForApp:", v20);
                break;
              case 470:
                objc_msgSend(v23, "setAppLaunchesOnDayOfWeekSundayForApp:", v20);
                break;
              case 471:
                objc_msgSend(v23, "setAppLaunchesOnDayOfWeekMondayForApp:", v20);
                break;
              case 472:
                objc_msgSend(v23, "setAppLaunchesOnDayOfWeekTuesdayForApp:", v20);
                break;
              case 473:
                objc_msgSend(v23, "setAppLaunchesOnDayOfWeekWednesdayForApp:", v20);
                break;
              case 474:
                objc_msgSend(v23, "setAppLaunchesOnDayOfWeekThursdayForApp:", v20);
                break;
              case 475:
                objc_msgSend(v23, "setAppLaunchesOnDayOfWeekFridayForApp:", v20);
                break;
              case 476:
                objc_msgSend(v23, "setAppLaunchesOnDayOfWeekSaturdayForApp:", v20);
                break;
              case 477:
                objc_msgSend(v23, "setAppLaunchesAtCoarseGeoHash0ForApp:", v20);
                break;
              case 478:
                objc_msgSend(v23, "setAppLaunchesAtCoarseGeoHash1ForApp:", v20);
                break;
              case 479:
                objc_msgSend(v23, "setAppLaunchesAtCoarseGeoHash2ForApp:", v20);
                break;
              case 480:
                objc_msgSend(v23, "setAppLaunchesAtCoarseGeoHash3ForApp:", v20);
                break;
              case 481:
                objc_msgSend(v23, "setAppLaunchesAtCoarseGeoHash4ForApp:", v20);
                break;
              case 482:
                objc_msgSend(v23, "setAppLaunchesAtCoarseGeoHash5ForApp:", v20);
                break;
              case 483:
                objc_msgSend(v23, "setAppLaunchesAtCoarseGeoHash6ForApp:", v20);
                break;
              case 484:
                objc_msgSend(v23, "setAppLaunchesAtCoarseGeoHash7ForApp:", v20);
                break;
              case 485:
                objc_msgSend(v23, "setAppLaunchesAtCoarseGeoHash8ForApp:", v20);
                break;
              case 486:
                objc_msgSend(v23, "setAppLaunchesAtCoarseGeoHash9ForApp:", v20);
                break;
              case 487:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash0ForApp:", v20);
                break;
              case 488:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash1ForApp:", v20);
                break;
              case 489:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash2ForApp:", v20);
                break;
              case 490:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash3ForApp:", v20);
                break;
              case 491:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash4ForApp:", v20);
                break;
              case 492:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash5ForApp:", v20);
                break;
              case 493:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash6ForApp:", v20);
                break;
              case 494:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash7ForApp:", v20);
                break;
              case 495:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash8ForApp:", v20);
                break;
              case 496:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash9ForApp:", v20);
                break;
              case 497:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash10ForApp:", v20);
                break;
              case 498:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash11ForApp:", v20);
                break;
              case 499:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash12ForApp:", v20);
                break;
              case 500:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash13ForApp:", v20);
                break;
              case 501:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHash14ForApp:", v20);
                break;
              case 502:
                objc_msgSend(v23, "setAppNumberOfSpecificGeohashesForApp:", v20);
                break;
              case 503:
                objc_msgSend(v23, "setAppNumberOfCoarseGeohashesForApp:", v20);
                break;
              case 504:
                objc_msgSend(v23, "setAppEntropyForTimeBuckets:", v20);
                break;
              case 505:
                objc_msgSend(v23, "setAppEntropyForSpecificGeoHash:", v20);
                break;
              case 506:
                objc_msgSend(v23, "setAppEntropyForCoarseGeoHash:", v20);
                break;
              case 507:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHashForAppInContext:", v20);
                break;
              case 508:
                objc_msgSend(v23, "setAppLaunchesAtCoarseGeoHashForAppInContext:", v20);
                break;
              case 509:
                objc_msgSend(v23, "setAppLaunchesAtDayOfWeekInContext:", v20);
                break;
              case 510:
                objc_msgSend(v23, "setAppLaunchesAtDayOfWeekForApp:", v20);
                break;
              case 511:
                objc_msgSend(v23, "setAppLaunchesAtTimeAndDayForAppInContext:", v20);
                break;
              case 512:
                objc_msgSend(v23, "setAppLaunchesAtTimeAndDayInContext:", v20);
                break;
              case 513:
                objc_msgSend(v23, "setAppLaunchesAtTimeAndDayForApp:", v20);
                break;
              case 514:
                objc_msgSend(v23, "setAppLaunchesAtCoarseGeoHashInContext:", v20);
                break;
              case 515:
                objc_msgSend(v23, "setAppLaunchesAtCoarseGeoHashForApp:", v20);
                break;
              case 516:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHashInContext:", v20);
                break;
              case 517:
                objc_msgSend(v23, "setAppLaunchesAtSpecificGeoHashForApp:", v20);
                break;
              case 518:
                objc_msgSend(v23, "setAppLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate:", v20);
                break;
              case 519:
                objc_msgSend(v23, "setAppLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate:", v20);
                break;
              case 520:
                objc_msgSend(v23, "setIsLocationServicesDisabled:", v20);
                break;
              case 521:
                objc_msgSend(v23, "setAppLaunchesInTwoHourTimeBucketForAppInContext:", v20);
                break;
              case 522:
                objc_msgSend(v23, "setAppLaunchesInTwoHourTimeBucketInContext:", v20);
                break;
              case 523:
                objc_msgSend(v23, "setAppLaunchesInTwoHourTimeBucketForApp:", v20);
                break;
              case 524:
                objc_msgSend(v23, "setAppConfirmsInTwoHourTimeBucketForAppInContext:", v20);
                break;
              case 525:
                objc_msgSend(v23, "setAppConfirmsInTwoHourTimeBucketInContext:", v20);
                break;
              case 526:
                objc_msgSend(v23, "setAppConfirmsInTwoHourTimeBucketForApp:", v20);
                break;
              case 527:
                objc_msgSend(v23, "setAppRejectsInTwoHourTimeBucketForAppInContext:", v20);
                break;
              case 528:
                objc_msgSend(v23, "setAppRejectsInTwoHourTimeBucketInContext:", v20);
                break;
              case 529:
                objc_msgSend(v23, "setAppRejectsInTwoHourTimeBucketForApp:", v20);
                break;
              case 530:
                objc_msgSend(v23, "setAppConfirmsAtDayOfWeekForAppInContext:", v20);
                break;
              case 531:
                objc_msgSend(v23, "setAppConfirmsAtDayOfWeekInContext:", v20);
                break;
              case 532:
                objc_msgSend(v23, "setAppConfirmsAtDayOfWeekForApp:", v20);
                break;
              case 533:
                objc_msgSend(v23, "setAppRejectsAtDayOfWeekForAppInContext:", v20);
                break;
              case 534:
                objc_msgSend(v23, "setAppRejectsAtDayOfWeekInContext:", v20);
                break;
              case 535:
                objc_msgSend(v23, "setAppRejectsAtDayOfWeekForApp:", v20);
                break;
              case 536:
                objc_msgSend(v23, "setAppConfirmsAtCoarseGeoHashForAppInContext:", v20);
                break;
              case 537:
                objc_msgSend(v23, "setAppConfirmsAtCoarseGeoHashInContext:", v20);
                break;
              case 538:
                objc_msgSend(v23, "setAppConfirmsAtCoarseGeoHashForApp:", v20);
                break;
              case 539:
                objc_msgSend(v23, "setAppRejectsAtCoarseGeoHashForAppInContext:", v20);
                break;
              case 540:
                objc_msgSend(v23, "setAppRejectsAtCoarseGeoHashInContext:", v20);
                break;
              case 541:
                objc_msgSend(v23, "setAppRejectsAtCoarseGeoHashForApp:", v20);
                break;
              case 542:
                objc_msgSend(v23, "setAppConfirmsAtSpecificGeoHashForAppInContext:", v20);
                break;
              case 543:
                objc_msgSend(v23, "setAppConfirmsAtSpecificGeoHashInContext:", v20);
                break;
              case 544:
                objc_msgSend(v23, "setAppConfirmsAtSpecificGeoHashForApp:", v20);
                break;
              case 545:
                objc_msgSend(v23, "setAppRejectsAtSpecificGeoHashForAppInContext:", v20);
                break;
              case 546:
                objc_msgSend(v23, "setAppRejectsAtSpecificGeoHashInContext:", v20);
                break;
              case 547:
                objc_msgSend(v23, "setAppRejectsAtSpecificGeoHashForApp:", v20);
                break;
              case 548:
                objc_msgSend(v23, "setAppConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate:", v20);
                break;
              case 549:
                objc_msgSend(v23, "setAppConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate:", v20);
                break;
              case 550:
                objc_msgSend(v23, "setAppRejectsForAllAppsAndContextsDecayedAtCoarseContextRate:", v20);
                break;
              case 551:
                objc_msgSend(v23, "setAppRejectsForAllAppsAndContextsDecayedAtSpecificContextRate:", v20);
                break;
              case 552:
                objc_msgSend(v23, "setCurrentTimeBucketFromZeroToTwentyFour:", v20);
                break;
              case 553:
                objc_msgSend(v23, "setActionsAtDayOfWeekForActionInContext:", v20);
                break;
              case 554:
                objc_msgSend(v23, "setActionsAtDayOfWeekInContext:", v20);
                break;
              case 555:
                objc_msgSend(v23, "setActionsAtDayOfWeekForAction:", v20);
                break;
              case 556:
                objc_msgSend(v23, "setActionsAtCoarseGeoHashForActionInContext:", v20);
                break;
              case 557:
                objc_msgSend(v23, "setActionsAtCoarseGeoHashInContext:", v20);
                break;
              case 558:
                objc_msgSend(v23, "setActionsAtCoarseGeoHashForAction:", v20);
                break;
              case 559:
                objc_msgSend(v23, "setActionsAtSpecificGeoHashForActionInContext:", v20);
                break;
              case 560:
                objc_msgSend(v23, "setActionsAtSpecificGeoHashInContext:", v20);
                break;
              case 561:
                objc_msgSend(v23, "setActionsAtSpecificGeoHashForAction:", v20);
                break;
              case 562:
                objc_msgSend(v23, "setActionsAtTimeOfDayForActionInContext:", v20);
                break;
              case 563:
                objc_msgSend(v23, "setActionsAtTimeOfDayInContext:", v20);
                break;
              case 564:
                objc_msgSend(v23, "setActionsAtTimeOfDayForAction:", v20);
                break;
              case 565:
                objc_msgSend(v23, "setActionConfirmsAtTimeOfDayForActionInContext:", v20);
                break;
              case 566:
                objc_msgSend(v23, "setActionConfirmsAtTimeOfDayInContext:", v20);
                break;
              case 567:
                objc_msgSend(v23, "setActionConfirmsAtTimeOfDayForAction:", v20);
                break;
              case 568:
                objc_msgSend(v23, "setActionRejectsAtTimeOfDayForActionInContext:", v20);
                break;
              case 569:
                objc_msgSend(v23, "setActionRejectsAtTimeOfDayInContext:", v20);
                break;
              case 570:
                objc_msgSend(v23, "setActionRejectsAtTimeOfDayForAction:", v20);
                break;
              case 571:
                objc_msgSend(v23, "setActionConfirmsAtDayOfWeekForActionInContext:", v20);
                break;
              case 572:
                objc_msgSend(v23, "setActionConfirmsAtDayOfWeekInContext:", v20);
                break;
              case 573:
                objc_msgSend(v23, "setActionConfirmsAtDayOfWeekForAction:", v20);
                break;
              case 574:
                objc_msgSend(v23, "setActionRejectsAtDayOfWeekForActionInContext:", v20);
                break;
              case 575:
                objc_msgSend(v23, "setActionRejectsAtDayOfWeekInContext:", v20);
                break;
              case 576:
                objc_msgSend(v23, "setActionRejectsAtDayOfWeekForAction:", v20);
                break;
              case 577:
                objc_msgSend(v23, "setActionConfirmsAtCoarseGeoHashForActionInContext:", v20);
                break;
              case 578:
                objc_msgSend(v23, "setActionConfirmsAtCoarseGeoHashInContext:", v20);
                break;
              case 579:
                objc_msgSend(v23, "setActionConfirmsAtCoarseGeoHashForAction:", v20);
                break;
              case 580:
                objc_msgSend(v23, "setActionRejectsAtCoarseGeoHashForActionInContext:", v20);
                break;
              case 581:
                objc_msgSend(v23, "setActionRejectsAtCoarseGeoHashInContext:", v20);
                break;
              case 582:
                objc_msgSend(v23, "setActionRejectsAtCoarseGeoHashForAction:", v20);
                break;
              case 583:
                objc_msgSend(v23, "setActionConfirmsAtSpecificGeoHashForActionInContext:", v20);
                break;
              case 584:
                objc_msgSend(v23, "setActionConfirmsAtSpecificGeoHashInContext:", v20);
                break;
              case 585:
                objc_msgSend(v23, "setActionConfirmsAtSpecificGeoHashForAction:", v20);
                break;
              case 586:
                objc_msgSend(v23, "setActionRejectsAtSpecificGeoHashForActionInContext:", v20);
                break;
              case 587:
                objc_msgSend(v23, "setActionRejectsAtSpecificGeoHashInContext:", v20);
                break;
              case 588:
                objc_msgSend(v23, "setActionRejectsAtSpecificGeoHashForAction:", v20);
                break;
              case 589:
                objc_msgSend(v23, "setActionsInTimeBucket0ForAction:", v20);
                break;
              case 590:
                objc_msgSend(v23, "setActionsInTimeBucket1ForAction:", v20);
                break;
              case 591:
                objc_msgSend(v23, "setActionsInTimeBucket2ForAction:", v20);
                break;
              case 592:
                objc_msgSend(v23, "setActionsInTimeBucket3ForAction:", v20);
                break;
              case 593:
                objc_msgSend(v23, "setActionsInTimeBucket4ForAction:", v20);
                break;
              case 594:
                objc_msgSend(v23, "setActionsInTimeBucket5ForAction:", v20);
                break;
              case 595:
                objc_msgSend(v23, "setActionsInTimeBucket6ForAction:", v20);
                break;
              case 596:
                objc_msgSend(v23, "setActionsInTimeBucket7ForAction:", v20);
                break;
              case 597:
                objc_msgSend(v23, "setActionsInTimeBucket8ForAction:", v20);
                break;
              case 598:
                objc_msgSend(v23, "setActionsInTimeBucket9ForAction:", v20);
                break;
              case 599:
                objc_msgSend(v23, "setActionsInTimeBucket10ForAction:", v20);
                break;
              case 600:
                objc_msgSend(v23, "setActionsInTimeBucket11ForAction:", v20);
                break;
              case 601:
                objc_msgSend(v23, "setActionsInTimeBucket12ForAction:", v20);
                break;
              case 602:
                objc_msgSend(v23, "setActionsInTimeBucket13ForAction:", v20);
                break;
              case 603:
                objc_msgSend(v23, "setActionsInTimeBucket14ForAction:", v20);
                break;
              case 604:
                objc_msgSend(v23, "setActionsInTimeBucket15ForAction:", v20);
                break;
              case 605:
                objc_msgSend(v23, "setActionsInTimeBucket16ForAction:", v20);
                break;
              case 606:
                objc_msgSend(v23, "setActionsInTimeBucket17ForAction:", v20);
                break;
              case 607:
                objc_msgSend(v23, "setActionsInTimeBucket18ForAction:", v20);
                break;
              case 608:
                objc_msgSend(v23, "setActionsInTimeBucket19ForAction:", v20);
                break;
              case 609:
                objc_msgSend(v23, "setActionsInTimeBucket20ForAction:", v20);
                break;
              case 610:
                objc_msgSend(v23, "setActionsInTimeBucket21ForAction:", v20);
                break;
              case 611:
                objc_msgSend(v23, "setActionsInTimeBucket22ForAction:", v20);
                break;
              case 612:
                objc_msgSend(v23, "setActionsInTimeBucket23ForAction:", v20);
                break;
              case 613:
                objc_msgSend(v23, "setActionsInTimeBucket24ForAction:", v20);
                break;
              case 614:
                objc_msgSend(v23, "setActionsOnDayOfWeekSundayForAction:", v20);
                break;
              case 615:
                objc_msgSend(v23, "setActionsOnDayOfWeekMondayForAction:", v20);
                break;
              case 616:
                objc_msgSend(v23, "setActionsOnDayOfWeekTuesdayForAction:", v20);
                break;
              case 617:
                objc_msgSend(v23, "setActionsOnDayOfWeekWednesdayForAction:", v20);
                break;
              case 618:
                objc_msgSend(v23, "setActionsOnDayOfWeekThursdayForAction:", v20);
                break;
              case 619:
                objc_msgSend(v23, "setActionsOnDayOfWeekFridayForAction:", v20);
                break;
              case 620:
                objc_msgSend(v23, "setActionsOnDayOfWeekSaturdayForAction:", v20);
                break;
              case 621:
                objc_msgSend(v23, "setActionsAtCoarseGeoHash0ForAction:", v20);
                break;
              case 622:
                objc_msgSend(v23, "setActionsAtCoarseGeoHash1ForAction:", v20);
                break;
              case 623:
                objc_msgSend(v23, "setActionsAtCoarseGeoHash2ForAction:", v20);
                break;
              case 624:
                objc_msgSend(v23, "setActionsAtCoarseGeoHash3ForAction:", v20);
                break;
              case 625:
                objc_msgSend(v23, "setActionsAtCoarseGeoHash4ForAction:", v20);
                break;
              case 626:
                objc_msgSend(v23, "setActionsAtCoarseGeoHash5ForAction:", v20);
                break;
              case 627:
                objc_msgSend(v23, "setActionsAtCoarseGeoHash6ForAction:", v20);
                break;
              case 628:
                objc_msgSend(v23, "setActionsAtCoarseGeoHash7ForAction:", v20);
                break;
              case 629:
                objc_msgSend(v23, "setActionsAtCoarseGeoHash8ForAction:", v20);
                break;
              case 630:
                objc_msgSend(v23, "setActionsAtCoarseGeoHash9ForAction:", v20);
                break;
              case 631:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash0ForAction:", v20);
                break;
              case 632:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash1ForAction:", v20);
                break;
              case 633:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash2ForAction:", v20);
                break;
              case 634:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash3ForAction:", v20);
                break;
              case 635:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash4ForAction:", v20);
                break;
              case 636:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash5ForAction:", v20);
                break;
              case 637:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash6ForAction:", v20);
                break;
              case 638:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash7ForAction:", v20);
                break;
              case 639:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash8ForAction:", v20);
                break;
              case 640:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash9ForAction:", v20);
                break;
              case 641:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash10ForAction:", v20);
                break;
              case 642:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash11ForAction:", v20);
                break;
              case 643:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash12ForAction:", v20);
                break;
              case 644:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash13ForAction:", v20);
                break;
              case 645:
                objc_msgSend(v23, "setActionsAtSpecificGeoHash14ForAction:", v20);
                break;
              case 646:
                objc_msgSend(v23, "setActionEntropyForTimeOfDay:", v20);
                break;
              case 647:
                objc_msgSend(v23, "setActionEntropyForDayOfWeek:", v20);
                break;
              case 648:
                objc_msgSend(v23, "setActionEntropyForCoarseGeoHash:", v20);
                break;
              case 649:
                objc_msgSend(v23, "setActionEntropyForSpecificGeoHash:", v20);
                break;
              case 650:
                objc_msgSend(v23, "setActionNumberOfSpecificGeohashesForAction:", v20);
                break;
              case 651:
                objc_msgSend(v23, "setActionNumberOfCoarseGeohashesForAction:", v20);
                break;
              case 652:
                objc_msgSend(v23, "setAppLaunchesAtZoom7GeoHashForAppInContext:", v20);
                break;
              case 653:
                objc_msgSend(v23, "setAppLaunchesAtZoom7GeoHashInContext:", v20);
                break;
              case 654:
                objc_msgSend(v23, "setAppLaunchesAtZoom7GeoHashForApp:", v20);
                break;
              case 655:
                objc_msgSend(v23, "setAppLaunchesAtZoom7GeoHash0ForApp:", v20);
                break;
              case 656:
                objc_msgSend(v23, "setAppLaunchesAtZoom7GeoHash1ForApp:", v20);
                break;
              case 657:
                objc_msgSend(v23, "setAppLaunchesAtZoom7GeoHash2ForApp:", v20);
                break;
              case 658:
                objc_msgSend(v23, "setAppLaunchesAtZoom7GeoHash3ForApp:", v20);
                break;
              case 659:
                objc_msgSend(v23, "setAppLaunchesAtZoom7GeoHash4ForApp:", v20);
                break;
              case 660:
                objc_msgSend(v23, "setAppLaunchesAtZoom7GeoHash5ForApp:", v20);
                break;
              case 661:
                objc_msgSend(v23, "setAppLaunchesAtZoom7GeoHash6ForApp:", v20);
                break;
              case 662:
                objc_msgSend(v23, "setAppLaunchesAtZoom7GeoHash7ForApp:", v20);
                break;
              case 663:
                objc_msgSend(v23, "setAppLaunchesAtZoom7GeoHash8ForApp:", v20);
                break;
              case 664:
                objc_msgSend(v23, "setAppLaunchesAtZoom7GeoHash9ForApp:", v20);
                break;
              case 665:
                objc_msgSend(v23, "setAppEntropyForZoom7GeoHash:", v20);
                break;
              case 666:
                objc_msgSend(v23, "setAppNumberOfZoom7GeohashesForApp:", v20);
                break;
              case 667:
                objc_msgSend(v23, "setAppGeoAssociationScoreAtZoom7:", v20);
                break;
              case 668:
                objc_msgSend(v23, "setAppGeoAssociationScoreAtZoom13:", v20);
                break;
              case 669:
                objc_msgSend(v23, "setAppGeoAssociationScoreAtZoom16:", v20);
                break;
              case 670:
                objc_msgSend(v23, "setAppPartOfWeekAssociationScore:", v20);
                break;
              case 671:
                objc_msgSend(v23, "setAppCoarseTimeAssociationScore:", v20);
                break;
              case 672:
                objc_msgSend(v23, "setAppLOITypeAssociationScore:", v20);
                break;
              case 673:
                objc_msgSend(v23, "setAppLaunchesAtSSIDForAppInContext:", v20);
                break;
              case 674:
                objc_msgSend(v23, "setAppLaunchesAtSSIDForApp:", v20);
                break;
              case 675:
                objc_msgSend(v23, "setAppLaunchesForCoreMotionForAppInContext:", v20);
                break;
              case 676:
                objc_msgSend(v23, "setAppLaunchesInAirplaneModeForAppInContext:", v20);
                break;
              case 677:
                objc_msgSend(v23, "setHomeScreenAppConfirmsOnDayOfWeekForAppInContext:", v20);
                break;
              case 678:
                objc_msgSend(v23, "setHomeScreenAppConfirmsOnDayOfWeekInContext:", v20);
                break;
              case 679:
                objc_msgSend(v23, "setHomeScreenAppConfirmsOnDayOfWeekForApp:", v20);
                break;
              case 680:
                objc_msgSend(v23, "setHomeScreenAppRejectsOnDayOfWeekForAppInContext:", v20);
                break;
              case 681:
                objc_msgSend(v23, "setHomeScreenAppRejectsOnDayOfWeekInContext:", v20);
                break;
              case 682:
                objc_msgSend(v23, "setHomeScreenAppRejectsOnDayOfWeekForApp:", v20);
                break;
              case 683:
                objc_msgSend(v23, "setHomeScreenAppConfirmsInTwoHourTimeIntervalForAppInContext:", v20);
                break;
              case 684:
                objc_msgSend(v23, "setHomeScreenAppConfirmsInTwoHourTimeIntervalInContext:", v20);
                break;
              case 685:
                objc_msgSend(v23, "setHomeScreenAppConfirmsInTwoHourTimeIntervalForApp:", v20);
                break;
              case 686:
                objc_msgSend(v23, "setHomeScreenAppRejectsInTwoHourTimeIntervalForAppInContext:", v20);
                break;
              case 687:
                objc_msgSend(v23, "setHomeScreenAppRejectsInTwoHourTimeIntervalInContext:", v20);
                break;
              case 688:
                objc_msgSend(v23, "setHomeScreenAppRejectsInTwoHourTimeIntervalForApp:", v20);
                break;
              case 689:
                objc_msgSend(v23, "setHomeScreenAppConfirmsAtCoarseGeohashForAppInContext:", v20);
                break;
              case 690:
                objc_msgSend(v23, "setHomeScreenAppConfirmsAtCoarseGeohashInContext:", v20);
                break;
              case 691:
                objc_msgSend(v23, "setHomeScreenAppConfirmsAtCoarseGeohashForApp:", v20);
                break;
              case 692:
                objc_msgSend(v23, "setHomeScreenAppRejectsAtCoarseGeohashForAppInContext:", v20);
                break;
              case 693:
                objc_msgSend(v23, "setHomeScreenAppRejectsAtCoarseGeohashInContext:", v20);
                break;
              case 694:
                objc_msgSend(v23, "setHomeScreenAppRejectsAtCoarseGeohashForApp:", v20);
                break;
              case 695:
                objc_msgSend(v23, "setHomeScreenAppConfirmsAtSpecificGeohashForAppInContext:", v20);
                break;
              case 696:
                objc_msgSend(v23, "setHomeScreenAppConfirmsAtSpecificGeohashInContext:", v20);
                break;
              case 697:
                objc_msgSend(v23, "setHomeScreenAppConfirmsAtSpecificGeohashForApp:", v20);
                break;
              case 698:
                objc_msgSend(v23, "setHomeScreenAppRejectsAtSpecificGeohashForAppInContext:", v20);
                break;
              case 699:
                objc_msgSend(v23, "setHomeScreenAppRejectsAtSpecificGeohashInContext:", v20);
                break;
              case 700:
                objc_msgSend(v23, "setHomeScreenAppRejectsAtSpecificGeohashForApp:", v20);
                break;
              case 701:
                objc_msgSend(v23, "setHomeScreenAppConfirmsAtCoarseTimePOWLocationForAppInContext:", v20);
                break;
              case 702:
                objc_msgSend(v23, "setHomeScreenAppConfirmsAtCoarseTimePOWLocationInContext:", v20);
                break;
              case 703:
                objc_msgSend(v23, "setHomeScreenAppConfirmsAtCoarseTimePOWLocationForApp:", v20);
                break;
              case 704:
                objc_msgSend(v23, "setHomeScreenAppRejectsAtCoarseTimePOWLocationForAppInContext:", v20);
                break;
              case 705:
                objc_msgSend(v23, "setHomeScreenAppRejectsAtCoarseTimePOWLocationInContext:", v20);
                break;
              case 706:
                objc_msgSend(v23, "setHomeScreenAppRejectsAtCoarseTimePOWLocationForApp:", v20);
                break;
              case 707:
                objc_msgSend(v23, "setHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationForAppInContext:", v20);
                break;
              case 708:
                objc_msgSend(v23, "setHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationInContext:", v20);
                break;
              case 709:
                objc_msgSend(v23, "setHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationForApp:", v20);
                break;
              case 710:
                objc_msgSend(v23, "setHomeScreenAppConfirmsAtSpecificTimeDOWLocationForAppInContext:", v20);
                break;
              case 711:
                objc_msgSend(v23, "setHomeScreenAppConfirmsAtSpecificTimeDOWLocationInContext:", v20);
                break;
              case 712:
                objc_msgSend(v23, "setHomeScreenAppConfirmsAtSpecificTimeDOWLocationForApp:", v20);
                break;
              case 713:
                objc_msgSend(v23, "setHomeScreenAppRejectsAtSpecificTimeDOWLocationForAppInContext:", v20);
                break;
              case 714:
                objc_msgSend(v23, "setHomeScreenAppRejectsAtSpecificTimeDOWLocationInContext:", v20);
                break;
              case 715:
                objc_msgSend(v23, "setHomeScreenAppRejectsAtSpecificTimeDOWLocationForApp:", v20);
                break;
              case 716:
                objc_msgSend(v23, "setHomeScreenTotalLaunchesForApp:", v20);
                break;
              case 717:
                objc_msgSend(v23, "setHomeScreenTotalLaunchesForAllApps:", v20);
                break;
              case 718:
                objc_msgSend(v23, "setAppDirectoryTotalLaunchesForApp:", v20);
                break;
              case 719:
                objc_msgSend(v23, "setAppDirectoryTotalLaunchesForAllApps:", v20);
                break;
              case 720:
                objc_msgSend(v23, "setAppDirectoryConfirmsOnDayOfWeekForAppInContext:", v20);
                break;
              case 721:
                objc_msgSend(v23, "setAppDirectoryConfirmsOnDayOfWeekInContext:", v20);
                break;
              case 722:
                objc_msgSend(v23, "setAppDirectoryConfirmsOnDayOfWeekForApp:", v20);
                break;
              case 723:
                objc_msgSend(v23, "setAppDirectoryRejectsOnDayOfWeekForAppInContext:", v20);
                break;
              case 724:
                objc_msgSend(v23, "setAppDirectoryRejectsOnDayOfWeekInContext:", v20);
                break;
              case 725:
                objc_msgSend(v23, "setAppDirectoryRejectsOnDayOfWeekForApp:", v20);
                break;
              case 726:
                objc_msgSend(v23, "setAppDirectoryConfirmsInTwoHourTimeIntervalForAppInContext:", v20);
                break;
              case 727:
                objc_msgSend(v23, "setAppDirectoryConfirmsInTwoHourTimeIntervalInContext:", v20);
                break;
              case 728:
                objc_msgSend(v23, "setAppDirectoryConfirmsInTwoHourTimeIntervalForApp:", v20);
                break;
              case 729:
                objc_msgSend(v23, "setAppDirectoryRejectsInTwoHourTimeIntervalForAppInContext:", v20);
                break;
              case 730:
                objc_msgSend(v23, "setAppDirectoryRejectsInTwoHourTimeIntervalInContext:", v20);
                break;
              case 731:
                objc_msgSend(v23, "setAppDirectoryRejectsInTwoHourTimeIntervalForApp:", v20);
                break;
              case 732:
                objc_msgSend(v23, "setAppDirectoryConfirmsAtCoarseGeohashForAppInContext:", v20);
                break;
              case 733:
                objc_msgSend(v23, "setAppDirectoryConfirmsAtCoarseGeohashInContext:", v20);
                break;
              case 734:
                objc_msgSend(v23, "setAppDirectoryConfirmsAtCoarseGeohashForApp:", v20);
                break;
              case 735:
                objc_msgSend(v23, "setAppDirectoryRejectsAtCoarseGeohashForAppInContext:", v20);
                break;
              case 736:
                objc_msgSend(v23, "setAppDirectoryRejectsAtCoarseGeohashInContext:", v20);
                break;
              case 737:
                objc_msgSend(v23, "setAppDirectoryRejectsAtCoarseGeohashForApp:", v20);
                break;
              case 738:
                objc_msgSend(v23, "setAppDirectoryConfirmsAtSpecificGeohashForAppInContext:", v20);
                break;
              case 739:
                objc_msgSend(v23, "setAppDirectoryConfirmsAtSpecificGeohashInContext:", v20);
                break;
              case 740:
                objc_msgSend(v23, "setAppDirectoryConfirmsAtSpecificGeohashForApp:", v20);
                break;
              case 741:
                objc_msgSend(v23, "setAppDirectoryRejectsAtSpecificGeohashForAppInContext:", v20);
                break;
              case 742:
                objc_msgSend(v23, "setAppDirectoryRejectsAtSpecificGeohashInContext:", v20);
                break;
              case 743:
                objc_msgSend(v23, "setAppDirectoryRejectsAtSpecificGeohashForApp:", v20);
                break;
              case 744:
                objc_msgSend(v23, "setAppDirectoryConfirmsAtCoarseTimePOWLocationForAppInContext:", v20);
                break;
              case 745:
                objc_msgSend(v23, "setAppDirectoryConfirmsAtCoarseTimePOWLocationInContext:", v20);
                break;
              case 746:
                objc_msgSend(v23, "setAppDirectoryConfirmsAtCoarseTimePOWLocationForApp:", v20);
                break;
              case 747:
                objc_msgSend(v23, "setAppDirectoryRejectsAtCoarseTimePOWLocationForAppInContext:", v20);
                break;
              case 748:
                objc_msgSend(v23, "setAppDirectoryRejectsAtCoarseTimePOWLocationInContext:", v20);
                break;
              case 749:
                objc_msgSend(v23, "setAppDirectoryRejectsAtCoarseTimePOWLocationForApp:", v20);
                break;
              case 750:
                objc_msgSend(v23, "setAppDirectoryExplicitRejectsAtCoarseTimePOWLocationForAppInContext:", v20);
                break;
              case 751:
                objc_msgSend(v23, "setAppDirectoryExplicitRejectsAtCoarseTimePOWLocationInContext:", v20);
                break;
              case 752:
                objc_msgSend(v23, "setAppDirectoryExplicitRejectsAtCoarseTimePOWLocationForApp:", v20);
                break;
              case 753:
                objc_msgSend(v23, "setAppDirectoryConfirmsAtSpecificTimeDOWLocationForAppInContext:", v20);
                break;
              case 754:
                objc_msgSend(v23, "setAppDirectoryConfirmsAtSpecificTimeDOWLocationInContext:", v20);
                break;
              case 755:
                objc_msgSend(v23, "setAppDirectoryConfirmsAtSpecificTimeDOWLocationForApp:", v20);
                break;
              case 756:
                objc_msgSend(v23, "setAppDirectoryRejectsAtSpecificTimeDOWLocationForAppInContext:", v20);
                break;
              case 757:
                objc_msgSend(v23, "setAppDirectoryRejectsAtSpecificTimeDOWLocationInContext:", v20);
                break;
              case 758:
                objc_msgSend(v23, "setAppDirectoryRejectsAtSpecificTimeDOWLocationForApp:", v20);
                break;
              case 759:
                objc_msgSend(v23, "setHomeScreenAppConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate:", v20);
                break;
              case 760:
                objc_msgSend(v23, "setHomeScreenAppConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate:", v20);
                break;
              case 761:
                objc_msgSend(v23, "setHomeScreenAppRejectsForAllAppsAndContextsDecayedAtCoarseContextRate:", v20);
                break;
              case 762:
                objc_msgSend(v23, "setHomeScreenAppRejectsForAllAppsAndContextsDecayedAtSpecificContextRate:", v20);
                break;
              case 763:
                objc_msgSend(v23, "setHomeScreenAppExplicitRejectsForAllAppsAndContextsDecayedAtCoarseContextRate:", v20);
                break;
              case 764:
                objc_msgSend(v23, "setAppDirectoryConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate:", v20);
                break;
              case 765:
                objc_msgSend(v23, "setAppDirectoryConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate:", v20);
                break;
              case 766:
                objc_msgSend(v23, "setAppDirectoryRejectsForAllAppsAndContextsDecayedAtCoarseContextRate:", v20);
                break;
              case 767:
                objc_msgSend(v23, "setAppDirectoryRejectsForAllAppsAndContextsDecayedAtSpecificContextRate:", v20);
                break;
              case 768:
                objc_msgSend(v23, "setAppDirectoryExplicitRejectsForAllAppsAndContextsDecayedAtCoarseContextRate:", v20);
                break;
              case 769:
                objc_msgSend(v23, "setIsAppClip:", v20);
                break;
              case 770:
                objc_msgSend(v23, "setHomeScreenActionConfirmsOnDayOfWeekForActionInContext:", v20);
                break;
              case 771:
                objc_msgSend(v23, "setHomeScreenActionConfirmsOnDayOfWeekInContext:", v20);
                break;
              case 772:
                objc_msgSend(v23, "setHomeScreenActionConfirmsOnDayOfWeekForAction:", v20);
                break;
              case 773:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtTimeOfDayForActionInContext:", v20);
                break;
              case 774:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtTimeOfDayInContext:", v20);
                break;
              case 775:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtTimeOfDayForAction:", v20);
                break;
              case 776:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtCoarseGeohashForActionInContext:", v20);
                break;
              case 777:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtCoarseGeohashInContext:", v20);
                break;
              case 778:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtCoarseGeohashForAction:", v20);
                break;
              case 779:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtSpecificGeohashForActionInContext:", v20);
                break;
              case 780:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtSpecificGeohashInContext:", v20);
                break;
              case 781:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtSpecificGeohashForAction:", v20);
                break;
              case 782:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtCoarseTimePOWLocationForActionInContext:", v20);
                break;
              case 783:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtCoarseTimePOWLocationInContext:", v20);
                break;
              case 784:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtCoarseTimePOWLocationForAction:", v20);
                break;
              case 785:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtSpecificTimeDOWLocationForActionInContext:", v20);
                break;
              case 786:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtSpecificTimeDOWLocationInContext:", v20);
                break;
              case 787:
                objc_msgSend(v23, "setHomeScreenActionConfirmsAtSpecificTimeDOWLocationForAction:", v20);
                break;
              case 788:
                objc_msgSend(v23, "setHomeScreenActionRejectsOnDayOfWeekForActionInContext:", v20);
                break;
              case 789:
                objc_msgSend(v23, "setHomeScreenActionRejectsOnDayOfWeekInContext:", v20);
                break;
              case 790:
                objc_msgSend(v23, "setHomeScreenActionRejectsOnDayOfWeekForAction:", v20);
                break;
              case 791:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtTimeOfDayForActionInContext:", v20);
                break;
              case 792:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtTimeOfDayInContext:", v20);
                break;
              case 793:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtTimeOfDayForAction:", v20);
                break;
              case 794:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtCoarseGeohashForActionInContext:", v20);
                break;
              case 795:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtCoarseGeohashInContext:", v20);
                break;
              case 796:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtCoarseGeohashForAction:", v20);
                break;
              case 797:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtSpecificGeohashForActionInContext:", v20);
                break;
              case 798:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtSpecificGeohashInContext:", v20);
                break;
              case 799:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtSpecificGeohashForAction:", v20);
                break;
              case 800:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtCoarseTimePOWLocationForActionInContext:", v20);
                break;
              case 801:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtCoarseTimePOWLocationInContext:", v20);
                break;
              case 802:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtCoarseTimePOWLocationForAction:", v20);
                break;
              case 803:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtSpecificTimeDOWLocationForActionInContext:", v20);
                break;
              case 804:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtSpecificTimeDOWLocationInContext:", v20);
                break;
              case 805:
                objc_msgSend(v23, "setHomeScreenActionRejectsAtSpecificTimeDOWLocationForAction:", v20);
                break;
              case 806:
                objc_msgSend(v23, "setPoiPopularityForAppInContext:", v20);
                break;
              case 807:
                objc_msgSend(v23, "setAppLaunchPopularityAtPOIForAppInContext:", v20);
                break;
              case 808:
                objc_msgSend(v23, "setPoiCategory:", v20);
                break;
              case 809:
                objc_msgSend(v23, "setAppLaunchesAtPOIForAppInContext:", v20);
                break;
              case 810:
                objc_msgSend(v23, "setAppCategoryScore:", v20);
                break;
              case 811:
                objc_msgSend(v23, "setPosteriorProbabilityOfAppGivenMode:", v20);
                break;
              case 812:
                objc_msgSend(v23, "setClassConditionalProbabilityOfModeGivenApp:", v20);
                break;
              case 813:
                objc_msgSend(v23, "setUniqueOccurrencesOfAppInMode:", v20);
                break;
              case 814:
                objc_msgSend(v23, "setLocalOccurrencesOfAppInMode:", v20);
                break;
              case 815:
                objc_msgSend(v23, "setGlobalOccurrencesOfAppInMode:", v20);
                break;
              case 816:
                objc_msgSend(v23, "setAppModeEntityScore:", v20);
                break;
              default:
                break;
            }
          }
        }
        ++v9;
      }
      while (v6 != v9);
      v21 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v6 = v21;
    }
    while (v21);
  }

  return v23;
}

+ (int)awdConsumerSubTypeWithConsumerSubType:(unsigned __int8)a3
{
  if ((a3 - 1) > 0x2F)
    return 0;
  else
    return dword_1C9E7FFA0[(char)(a3 - 1)];
}

+ (int)awdLOITypeWithRTLOI:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return dword_1C9E800A0[a3];
}

+ (int)awdActionEngagementWithEngagement:(unint64_t)a3
{
  if (a3 - 1 < 0xA)
    return a3;
  else
    return 0;
}

+ (int)awdActionTypeWithActionType:(unint64_t)a3
{
  int result;
  NSObject *v4;

  result = 0;
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      result = 1;
      break;
    case 2uLL:
      result = 2;
      break;
    case 3uLL:
      __atxlog_handle_default();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        +[ATXAWDUtils awdActionTypeWithActionType:].cold.1(v4);

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("awdActionTypeWithActionType called with invalid ATXActionType value of %tu"), 3);
      goto LABEL_7;
    case 5uLL:
      result = 5;
      break;
    case 6uLL:
      result = 3;
      break;
    default:
LABEL_7:
      result = 4;
      break;
  }
  return result;
}

+ (int)awdAppLaunchReasonWithString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (launchReasonMap)
  {
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    launchReasonMap = (uint64_t)&unk_1E83D0900;

    if (!v4)
    {
LABEL_8:
      LODWORD(v5) = 0;
      goto LABEL_9;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  objc_msgSend((id)launchReasonMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend((id)launchReasonMap, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v6, "intValue");

  }
LABEL_9:

  return (int)v5;
}

+ (int)awdMotionTypeWithMotionType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 2;
  else
    return dword_1C9E80060[a3];
}

+ (id)appDataAtIndex:(unint64_t)a3 forSessionLogDict:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAWDUtils subscoresWithDictionary:](ATXAWDUtils, "subscoresWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSubscores:", v9);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Score"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Score"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(v6, "setScore:");

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EngagedApp"));
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EngagedApp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");

    if (v19 != -1)
      objc_msgSend(v6, "setEngagedApp:", a3 == 0);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppData"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("BundleId"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppData"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("BundleId"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBundleId:", v25);

  }
  return v6;
}

+ (id)populateAwdAppPredictionSessionForSessionLogDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  char v76;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "objectForKey:", CFSTR("CoreMotionLaunches"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CoreMotionLaunches"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCoreMotionLaunches:", objc_msgSend(v7, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TotalAirplaneModeLaunches"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalAirplaneModeLaunches"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTotalAirplaneModeLaunches:", objc_msgSend(v9, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("InAirplaneMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InAirplaneMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInAirplaneMode:", objc_msgSend(v11, "intValue") != 0);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("CoreMotionCurrentMotionLaunches"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CoreMotionCurrentMotionLaunches"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCoreMotionCurrentMotionLaunches:", objc_msgSend(v13, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TotalSpotlightLaunches"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalSpotlightLaunches"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTotalSpotlightLaunches:", objc_msgSend(v15, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TotalLaunchSequences"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalLaunchSequences"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTotalLaunchSequences:", objc_msgSend(v17, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TotalCurrentDayOfWeekLaunches"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalCurrentDayOfWeekLaunches"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTotalCurrentDayOfWeekLaunches:", objc_msgSend(v19, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TotalWifiLaunches"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalWifiLaunches"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTotalWifiLaunches:", objc_msgSend(v21, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TimeOfDayInterval"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TimeOfDayInterval"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeOfDayInterval:", objc_msgSend(v23, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TotalLaunches"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalLaunches"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTotalLaunches:", objc_msgSend(v25, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("EngagedApp"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EngagedApp"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEngagedApp:", objc_msgSend(v27, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TotalTrendingLaunches"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalTrendingLaunches"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTotalTrendingLaunches:", objc_msgSend(v29, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TotalTimeOfDayLaunches"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalTimeOfDayLaunches"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTotalTimeOfDayLaunches:", objc_msgSend(v31, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TotalSSIDLaunches"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalSSIDLaunches"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTotalSSIDLaunches:", objc_msgSend(v33, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("LocationDistanceFromHome"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LocationDistanceFromHome"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocationDistanceFromHome:", objc_msgSend(v35, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("LocationDistanceFromWork"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LocationDistanceFromWork"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocationDistanceFromWork:", objc_msgSend(v37, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("LocationDistanceFromSchool"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LocationDistanceFromSchool"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocationDistanceFromSchool:", objc_msgSend(v39, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("LocationDistanceFromGym"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LocationDistanceFromGym"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocationDistanceFromGym:", objc_msgSend(v41, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("IsInternalBuild"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsInternalBuild"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsInternalBuild:", objc_msgSend(v43, "BOOLValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("PredictionCacheAge"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PredictionCacheAge"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPredictionCacheAge:", objc_msgSend(v45, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("session_log_version"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("session_log_version"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSessionLogVersion:", objc_msgSend(v47, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TotalSpotlightTimeOfDayLaunches"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalSpotlightTimeOfDayLaunches"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTotalSpotlightLaunches:", objc_msgSend(v49, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TotalDayOfWeekLaunches"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalDayOfWeekLaunches"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTotalDayOfWeekLaunches:", objc_msgSend(v51, "intValue"));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("APRFeedbackSource"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("APRFeedbackSource"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAPRFeedbackSource:", v53);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("APREngagementType"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("APREngagementType"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAPREngagementType:", v55);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("APRSiriExperience"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("APRSiriExperience"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAPRSiriExperience:", v57);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("IntentType"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntentType"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIntentType:", v59);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("ConsumerType"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ConsumerType"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConsumerType:", v61);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("ConsumerSubType"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    v76 = 0;
    v63 = (void *)MEMORY[0x1E0CF9508];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ConsumerSubType"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v63, "consumerSubtypeForString:found:", v64, &v76);

    if (v76)
      objc_msgSend(v5, "setConsumerSubType:", +[ATXAWDUtils awdConsumerSubTypeWithConsumerSubType:](ATXAWDUtils, "awdConsumerSubTypeWithConsumerSubType:", v65));
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("CurrentLOIType"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurrentLOIType"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCurrentLOIType:", objc_msgSend(a1, "AWDLOITypeForString:", v67));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("AppSequence"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppSequence"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAppSequences:", v69);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("Outcome"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Outcome"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOutcome:", objc_msgSend(a1, "awdPredictionOutcomeWithATXPredictionOutcome:", (int)objc_msgSend(v71, "intValue")));

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("ABGroup"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ABGroup"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setABGroup:", v73);

  }
  v74 = v5;

  return v74;
}

+ (void)logAppPredictionDictionaryViaAWD:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  uint8_t buf[4];
  __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AppData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppData"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        v9 = 0;
        do
        {
          +[ATXAWDUtils appDataAtIndex:forSessionLogDict:](ATXAWDUtils, "appDataAtIndex:forSessionLogDict:", v9, v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setSessionId:", v7);
          AWDPostMetric();
          __atxlog_handle_feedback();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "bundleId");
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v10, "engagedApp");
            *(_DWORD *)buf = 138412546;
            v14 = CFSTR("NO");
            if (v13)
              v14 = CFSTR("YES");
            v23 = v12;
            v24 = 2112;
            v25 = v14;
            _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "ATXAppPredictorSessionLog - logged AWDProactiveAppData with bundleId: %@ engagedApp: %@", buf, 0x16u);

          }
          ++v9;
        }
        while (v9 < objc_msgSend(v8, "count"));
      }
      +[ATXAWDUtils populateAwdAppPredictionSessionForSessionLogDict:](ATXAWDUtils, "populateAwdAppPredictionSessionForSessionLogDict:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSessionId:", v7);
      AWDPostMetric();
      __atxlog_handle_feedback();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(v15, "consumerSubType");
        if (v17 >= 0x28)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = off_1E82DF918[(int)v17];
        }
        v19 = v18;
        v20 = objc_msgSend(v15, "outcome");
        if (v20 >= 9)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v20);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = off_1E82DFA58[(int)v20];
        }
        *(_DWORD *)buf = 138412546;
        v23 = v19;
        v24 = 2112;
        v25 = v21;
        _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "ATXAppPredictorSessionLog - logged AWDProactiveAppPredictionSession with consumerSubType: %@ engagementType: %@", buf, 0x16u);

      }
    }
  }

}

+ (int)awdPredictionOutcomeWithATXPredictionOutcome:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return 0;
  else
    return dword_1C9E80074[a3 - 1];
}

+ (int)AWDLOITypeForString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Work")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Home")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Gym")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)awdScoreWithScore:type:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_5_1(&dword_1C9A3B000, v0, v1, "int32_t underflow for score of %f for scoreType: %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)awdScoreWithScore:type:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_5_1(&dword_1C9A3B000, v0, v1, "int32_t overflow for score of %f for scoreType: %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)awdActionTypeWithActionType:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = 3;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "awdActionTypeWithActionType called with invalid ATXActionType value of %tu", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
